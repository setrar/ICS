library ieee;
use ieee.std_logic_1164.all;

use work.crypto_pkg.all;

entity crypto_engine is
    port (
        clk: in std_ulogic; -- Clock signal input
        sresetn: in std_ulogic; -- Reset signal input
        go: in std_ulogic; -- Start signal input
        key: in w128; -- 128 bit encryption key input
        p: in w128; -- 128 plain text input
        done: out std_ulogic; -- Signal used to tell when the encryption/decryption is done
        c: out w128 -- ciphertext output
    );
end entity crypto_engine;

architecture rtl of crypto_engine is
    signal i: integer range 0 to 31; -- Increasing counter from 0 to 31 for encryption and for round key generation in decryption
    signal icnt: std_ulogic; -- Increase counter i
    signal icz: std_ulogic; -- Put increase counter i to 0
    signal mux_key_en: std_ulogic; -- Key multiplexer input selection
    signal mux_key_out: w128; -- Key multiplexer output
    signal key_reg: w128; -- Key register
    signal mux_data_en: std_ulogic; -- Data multiplexer input selection
    signal mux_data_out: w128; -- Data multiplexer output
    signal data_reg: w128; -- Data registry
    signal w_en_data: std_ulogic; -- Data registry write-enable signal

    type type_state is (Idle0, Enc_round, Enc_finish, Enc_end);
    signal CS, NS: type_state;
begin
    -- Key expansion multiplexer
    mux_key_out <= compute_initial_rks(key) when mux_key_en = '0' else compute_next_rki(key_reg, i);

    -- Round data multiplexer
    mux_data_out <= p when mux_data_en = '0' else F(data_reg, key_reg(31 downto 0));

    write_reg: process(clk) -- Registers actualization process
    begin
        if rising_edge(clk) then
            if sresetn = '0' then
                key_reg <= (others => '0');
                data_reg <= (others => '0');
            else
                key_reg <= mux_key_out; -- The key register doesn't need a write enable flag

                if w_en_data = '1' then -- Writing is enabled only during a round and to load the plaintext, it remains in read-only state at the end to read the ciphertext
                    data_reg <= mux_data_out;
                end if;
            end if;
        end if;
    end process write_reg;

    c <= R(data_reg);

    inc_counter: process(clk) -- Increasing counter to know the ongoing round and use the correct round key
    begin
        if(rising_edge(clk)) then
            if(sresetn = '0' or icz = '1') then
                i <= 0;
            elsif(icnt = '1' and i < 31) then
                i <= i+1;
            end if;
        end if;
    end process;

    -- Final state machine

    seq0: process(clk) --Sequential process
    begin
        if (rising_edge(clk)) then
            if(sresetn = '0') then
                CS <= Idle0;
            else
                CS <= NS;
            end if;
        end if;
    end process seq0;

    com0: process(CS, go, i) -- Combinatorial process
    begin
        w_en_data <= '0';
        mux_key_en <= '0';
        mux_data_en <= '0';
        done <= '0';
        icnt <= '0';
        icz <= '0';
        case CS is
            when Idle0 =>
                if go = '1' then
                    NS <= Enc_round;
                    w_en_data <= '1';
                    mux_key_en <= '1';
                    icnt <= '1';
                else
                    NS <= Idle0;
                    icz <= '1';
                end if;

            -- Encryption flow
            when Enc_round =>
                if i = 31 then
                    NS <= Enc_finish;
                    mux_key_en <= '1';
                    mux_data_en <= '1';
                    w_en_data <= '1';
                else
                    NS <= Enc_round;
                    mux_key_en <= '1';
                    mux_data_en <= '1';
                    w_en_data <= '1';
                    icnt <= '1';
                end if;
            
            when Enc_finish =>
                NS <= Enc_end;
                mux_data_en <= '1';
                w_en_data <= '1';

            when Enc_end =>
                NS <= Idle0;
                done <= '1';
                icz <= '1';
        end case;
    end process com0;    
end architecture rtl;
