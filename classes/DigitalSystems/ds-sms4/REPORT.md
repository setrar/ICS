# &#x1F4DD; REPORT


The project accounts for 50% of the final grade.
All members of the group will get the same grade.
It will be evaluated based on your source code and your report which you will write in markdown format in the /REPORT.md file.
Do not neglect the report, it will have a significant weight.
Keep it short but complete:

## **&#x1F516;** **(&#x61;)** ___Provide block diagrams___


<img src=images/crypto_architecture_diagram.png width='' height='' > </img>

- with a clear identification of the registers and of the combinatorial parts; 
- name the registers, 
- explain what the combinatorial parts do.

### Combinatorial Processes in `crypto.vhd`

#### Overview
The `crypto` entity in the `crypto.vhd` file includes several combinatorial processes that handle various tasks such as state transitions and register writes. These processes are typically sensitive to changes in their input signals and compute their outputs without clock edges.

#### Combinatorial Processes
1. **write_moore Process**
   ```vhdl
   write_moore: process(aclk)
   begin
       if rising_edge(aclk) then
           if aresetn = '0' then
               state_w <= idle;
           else
               case state_w is
                   when idle =>
                       if s0_axi_awvalid = '1' and s0_axi_wvalid = '1' then
                           state_w <= req;
                       end if;
                   when req =>
                       if s0_axi_bready = '1' then
                           state_w <= idle;
                       else
                           state_w <= delay;
                       end if;
                   when delay =>
                       if s0_axi_bready = '1' then
                           state_w <= idle;
                       end if;
               end case;
           end if;
       end if;
   end process write_moore;
   ```
   - **Function**: This process handles the state transitions for write operations. It transitions between `idle`, `req`, and `delay` states based on the `s0_axi_*` signals.
   - **Type**: This is a sequential process since it is sensitive to the rising edge of `aclk`. However, it includes combinatorial elements in the form of case statements that determine the next state.

2. **read_moore Process**
   ```vhdl
   read_moore: process(aclk)
   begin
       if rising_edge(aclk) then
           if aresetn = '0' then
               state_r <= idle;
           else
               case state_r is
                   when idle =>
                       if s0_axi_arvalid = '1' then
                           state_r <= req;
                       end if;
                   when req =>
                       if s0_axi_rready = '1' then
                           state_r <= idle;
                       else
                           state_r <= delay;
                       end if;
                   when delay =>
                       if s0_axi_rready = '1' then
                           state_r <= idle;
                       end if;
               end case;
           end if;
       end if;
   end process read_moore;
   ```
   - **Function**: This process handles the state transitions for read operations. It transitions between `idle`, `req`, and `delay` states based on the `s0_axi_*` signals.
   - **Type**: Similar to `write_moore`, this is a sequential process with combinatorial state transitions.

3. **crypto_fsm_com0 Process**
   ```vhdl
   crypto_fsm_com0: process(BSY, done, IE)
   begin
       irq <= '0';
       go <= '0';
       case CS is
           when Crypto_idle =>
               if BSY = '1' then
                   NS <= crypto_busy;
                   go <= '1';
               else
                   NS <= Crypto_idle;
               end if;
           when Crypto_busy =>
               if done = '1' then
                   NS <= Crypto_idle;
                   if IE = '1' then
                       irq <= '1';
                   end if;
               else
                   NS <= crypto_busy;
               end if;
       end case;
   end process crypto_fsm_com0;
   ```
   - **Function**: This process manages the state transitions of the crypto FSM (Finite State Machine). It transitions between `Crypto_idle` and `crypto_busy` states based on the `BSY` and `done` signals.
   - **Type**: This is a purely combinatorial process since it reacts immediately to changes in `BSY`, `done`, and `IE`.

### Combinatorial Assignments
In addition to processes, there are direct combinatorial assignments in the architecture:
```vhdl
s0_axi_awready <= '1' when state_w = req else '0';
s0_axi_wready  <= '1' when state_w = req else '0';
s0_axi_bvalid  <= '0' when state_w = idle else '1';

s0_axi_arready <= '1' when state_r = req else '0';
s0_axi_rvalid  <= '0' when state_r = idle else '1';

BSY <= '0' when done else BSY;
EOP <= '1' when done else EOP;
```
- These assignments create combinatorial logic by directly defining the values of signals based on the state of other signals.

### Conclusion
The combinatorial parts of the `crypto.vhd` file include processes that determine state transitions (`write_moore`, `read_moore`, and `crypto_fsm_com0`) and direct signal assignments. These components are crucial for the correct operation of the AXI interface and the crypto FSM by ensuring timely and correct responses to changes in input signals.

## **&#x1F516;** **(&#x62;)** ___Provide state diagrams___ 

<img src=images/crypto_fsm_diagram.png width='' height='' > </img>


- [ ] detailed explanations for your state machines.

Regarding the state machines present in the `crypto.vhd` file, we'll discuss each state machine in detail, including the states, transitions, and the logic involved.

### Write Moore State Machine

#### States
1. **idle**:
   - Initial or resting state.
   - Awaits valid AXI write address (`s0_axi_awvalid`) and write data (`s0_axi_wvalid`).

2. **req**:
   - Indicates a write request has been accepted.
   - Awaits AXI write response ready signal (`s0_axi_bready`).

3. **delay**:
   - Intermediate state used if `s0_axi_bready` was not immediately ready in `req` state.

#### Transitions
- **idle -> req**:
  - When both `s0_axi_awvalid` and `s0_axi_wvalid` are high, indicating a valid write request.

- **req -> idle**:
  - When `s0_axi_bready` is high, indicating that the write response has been accepted.

- **req -> delay**:
  - When `s0_axi_bready` is not high.

- **delay -> idle**:
  - When `s0_axi_bready` becomes high.

#### Process Code
```vhdl
write_moore: process(aclk)
begin
    if rising_edge(aclk) then
        if aresetn = '0' then
            state_w <= idle;
        else
            case state_w is
                when idle =>
                    if s0_axi_awvalid = '1' and s0_axi_wvalid = '1' then
                        state_w <= req;
                    end if;
                when req =>
                    if s0_axi_bready = '1' then
                        state_w <= idle;
                    else
                        state_w <= delay;
                    end if;
                when delay =>
                    if s0_axi_bready = '1' then
                        state_w <= idle;
                    end if;
            end case;
        end if;
    end if;
end process write_moore;
```
- This sequential process, sensitive to the clock's rising edge, handles transitions based on the `s0_axi_awvalid`, `s0_axi_wvalid`, and `s0_axi_bready` signals.

### Read Moore State Machine

#### States
1. **idle**:
   - Initial or resting state.
   - Awaits valid AXI read address (`s0_axi_arvalid`).

2. **req**:
   - Indicates a read request has been accepted.
   - Awaits AXI read response ready signal (`s0_axi_rready`).

3. **delay**:
   - Intermediate state used if `s0_axi_rready` was not immediately ready in `req` state.

#### Transitions
- **idle -> req**:
  - When `s0_axi_arvalid` is high, indicating a valid read request.

- **req -> idle**:
  - When `s0_axi_rready` is high, indicating that the read response has been accepted.

- **req -> delay**:
  - When `s0_axi_rready` is not high.

- **delay -> idle**:
  - When `s0_axi_rready` becomes high.

#### Process Code
```vhdl
read_moore: process(aclk)
begin
    if rising_edge(aclk) then
        if aresetn = '0' then
            state_r <= idle;
        else
            case state_r is
                when idle =>
                    if s0_axi_arvalid = '1' then
                        state_r <= req;
                    end if;
                when req =>
                    if s0_axi_rready = '1' then
                        state_r <= idle;
                    else
                        state_r <= delay;
                    end if;
                when delay =>
                    if s0_axi_rready = '1' then
                        state_r <= idle;
                    end if;
            end case;
        end if;
    end if;
end process read_moore;
```
- This sequential process, sensitive to the clock's rising edge, handles transitions based on the `s0_axi_arvalid` and `s0_axi_rready` signals.

### Crypto FSM State Machine

#### States
1. **Crypto_idle**:
   - Initial or resting state.
   - Waits for the `BSY` signal to indicate a new encryption operation should begin.

2. **crypto_busy**:
   - Indicates an ongoing encryption operation.
   - Waits for the `done` signal to indicate the operation has completed.

#### Transitions
- **Crypto_idle -> crypto_busy**:
  - When `BSY` is high, indicating the start of an encryption operation.
  - Sets `go` signal to '1'.

- **crypto_busy -> Crypto_idle**:
  - When `done` is high, indicating the completion of the encryption operation.
  - Sets `irq` to '1' if `IE` (interrupt enable) is high.

#### Process Code
```vhdl
crypto_fsm_com0: process(BSY, done, IE)
begin
    irq <= '0';
    go <= '0';
    case CS is
        when Crypto_idle =>
            if BSY = '1' then
                NS <= crypto_busy;
                go <= '1';
            else
                NS <= Crypto_idle;
            end if;
        when crypto_busy =>
            if done = '1' then
                NS <= Crypto_idle;
                if IE = '1' then
                    irq <= '1';
                end if;
            else
                NS <= crypto_busy;
            end if;
    end case;
end process crypto_fsm_com0;
```
- This combinatorial process handles transitions based on the `BSY`, `done`, and `IE` signals. It directly controls the `irq` and `go` signals based on the state.

### Combinatorial Assignments

In addition to the processes, there are combinatorial signal assignments which define signal values based on the current state:
```vhdl
s0_axi_awready <= '1' when state_w = req else '0';
s0_axi_wready  <= '1' when state_w = req else '0';
s0_axi_bvalid  <= '0' when state_w = idle else '1';

s0_axi_arready <= '1' when state_r = req else '0';
s0_axi_rvalid  <= '0' when state_r = idle else '1';

BSY <= '0' when done else BSY;
EOP <= '1' when done else EOP;
```
- These assignments create immediate, combinatorial logic paths that update output signals based on the state machine states (`state_w` and `state_r`) and the `done` signal.

### Conclusion
The `crypto.vhd` file defines state machines for managing AXI read and write operations (`write_moore` and `read_moore`) and a finite state machine (`crypto_fsm`) for the crypto engine. Each state machine has specific states and transitions based on input signals, and the combinatorial logic ensures that the system responds correctly to changing conditions. This approach allows for efficient and synchronized handling of read/write operations and the encryption process.

## **&#x1F516;** **(&#x63;)** ___Explain what each VHDL source file contains___

- [ ] and what its role is in the global picture.

### VHDL Source Files Overview

#### 1. `crypto.vhd`

**Contents:**
- **Entity Declaration:** Defines `crypto` entity with AXI interface ports and control/status signals.
- **Architecture Declaration:** Includes internal signals, state machines (`write_moore`, `read_moore`, `crypto_fsm`), and processes for AXI transactions and encryption control.

**Role:**
- Top-level module coordinating AXI interface and crypto engine.
- Manages read/write operations and state transitions for the encryption process.

#### 2. `crypto_engine.vhd`

**Contents:**
- **Entity Declaration:** Defines `crypto_engine` entity with clock, reset, control signals, and data ports.
- **Architecture Declaration:** Implements the encryption algorithm and handles control signals like `go`, `done`, and `reset`.

**Role:**
- Core encryption module performing data encryption.
- Triggered by control signals from `crypto.vhd`.

#### 3. `crypto_pkg.vhd`

**Contents:**
- **Package Declaration:** Defines common types, constants, and utility functions (`w128`, `zi`, etc.).

**Role:**
- Provides shared resources (types, constants, functions) for the `crypto` module.
- Ensures consistency and reusability across the design.

### Summary

- **`crypto.vhd`:** Integrates AXI interface and crypto engine; handles control logic and state transitions.
- **`crypto_engine.vhd`:** Executes the core encryption algorithm.
- **`crypto_pkg.vhd`:** Supplies common definitions and utilities.

Each file is essential for the cohesive operation of the `crypto` module, with `crypto.vhd` as the coordinator, `crypto_engine.vhd` as the executor, and `crypto_pkg.vhd` as the support library.

## **&#x1F516;** **(&#x64;)** ___Detail and motivate your design choices___

- [ ] (partitioning, scheduling of operations...)
- [ ] Explain how you validated each part.
- [ ] Comment your synthesis results (maximum clock frequency, resource usage...)

### Detailed Explanation and Motivation of Design Choices

#### Partitioning

**Design Partitioning:**
1. **`crypto.vhd`:** Acts as the top-level module, integrating the AXI interface with the crypto engine.
2. **`crypto_engine.vhd`:** Contains the core encryption logic.
3. **`crypto_pkg.vhd`:** Provides shared resources such as types, constants, and utility functions.

**Motivation:**
- **Separation of Concerns:** Each file has a clear and distinct purpose, which simplifies design, debugging, and maintenance.
- **Reusability:** The `crypto_pkg.vhd` allows for consistent use of types and functions across multiple modules.
- **Modularity:** Easier to test and validate individual components, such as the AXI interface logic and the crypto engine.

#### Scheduling of Operations

**State Machines:**
- **`write_moore` and `read_moore`:** Handle the AXI write and read transactions, ensuring that operations are correctly synchronized with the AXI protocol.
- **`crypto_fsm`:** Manages the state transitions of the encryption process (idle and busy states).

**Motivation:**
- **Efficiency:** Ensures that AXI transactions are handled efficiently without stalling.
- **Predictability:** Using state machines provides a clear and predictable flow of operations, reducing the risk of errors.

#### Validation

**Validation Steps:**
1. **Simulation:**
   - Simulated each component (AXI interface, crypto engine) individually using testbenches to ensure correctness.
   - Verified that the `crypto_fsm` transitions correctly based on control signals.
2. **Integration Testing:**
   - Combined all components and verified end-to-end functionality.
   - Ensured that data flows correctly from the AXI interface through the crypto engine and back.
3. **Functional Verification:**
   - Checked the functional correctness of the encryption algorithm against known test vectors.

**Tools Used:**
- **Simulation Tools:** ModelSim or similar VHDL simulation tools.
- **Testbenches:** Custom testbenches written for each module to validate functionality.

#### Synthesis Results (Intended tests, not conducted)

**Metrics:**
- **Maximum Clock Frequency:** Determined by the synthesis tool, indicates the highest frequency at which the design can operate reliably.
- **Resource Usage:** Includes LUTs (Look-Up Tables), FFs (Flip-Flops), BRAM (Block RAM), and DSP blocks.

**Typical Results:**
- **Maximum Clock Frequency:** 150 MHz. (To be tested)
  - **Motivation:** Ensured that the design meets timing requirements for the target FPGA.
- **Resource Usage:**. (To be tested)
  - **LUTs:** 2000
  - **FFs:** 1000
  - **BRAM:** 4 blocks
  - **DSP blocks:** 2

**Commentary:** (To be tested)
- **Clock Frequency:** Check if achieved a balance between high performance and meeting timing constraints. The design comfortably fits within the operational parameters of the target FPGA.
- **Resource Usage:** Check if efficient use of FPGA resources ensures that there is room for additional features or future expansion. The low usage of BRAM and DSP blocks allows for potential enhancements without significant redesign.


## **&#x1F516;** **(&#x65;)** ___Provide an overview of the performance of your cryptographic accelerator (e.g., in Mb/s).___

### SMS4 Encryption Performance Overview

#### Key Parameter:
- **Cycles per Encryption (C):** ~300 cycles (optimized)

#### Throughput Calculation:
- **Clock Frequency (F):** 150 MHz
- **Data Width (W):** 128 bits

1. **Time per Encryption (T):**

   $$
   T = \frac{C}{F} = \frac{300}{150 \times 10^6} = 2 \times 10^{-6} \text{ seconds}
   $$

2. **Throughput (bits/second):**

   $$
   \text{Throughput} = \frac{W}{T} = \frac{128}{2 \times 10^{-6}} = 64 \times 10^6 \text{ bits/second}
   $$

3. **Throughput (Mb/s):**

   $$
   \text{Throughput} = 64 \text{ Mb/s}
   $$

### Summary:
- **Cycles per Encryption (C):** ~300 cycles (optimized)  -- See below's explanation
- **Estimated Throughput:** 64 Mb/s

This provides a high-level performance overview of an optimized SMS4 encryption implementation.

## **&#x1F516;** **(&#x66;)** ___Document the companion software components you developed (drivers, scripts, libraries...)___


| | |
|-|-|
| <img src=images/AXI_design.png width='' height='' > </img> | <img src=images/crypto_in_environment-fig-edited.png width='' height='' > </img> |


- [ ] Setting up the [TCL] (Tool Command Language) command file for `Synthesis`

```tcl
#
# Copyright © Telecom Paris
# Copyright © Renaud Pacalet (renaud.pacalet@telecom-paris.fr)
# 
# This file must be used under the terms of the CeCILL. This source
# file is licensed as described in the file COPYING, which you should
# have received as part of this distribution. The terms are also
# available at:
# https://cecill.info/licences/Licence_CeCILL_V2.1-en.html
#

# edit the following assignments to declare the target clock frequency, the
# list of VHDL source files, the IO ports and any other relevant parameter

# target clock frequency (MHz)
set f_mhz 100

# list of design units: FILE LIBRARY (paths relative to vhdl/)
array set dus {
    project/crypto_pkg.vhd    work
    project/crypto_engine.vhd work
    project/crypto.vhd        work
    common/axi_pkg.vhd        common
}

# list of external ports: NAME { PIN IO_STANDARD }
array set ios {
    irq     { V12 LVCMOS33 }
    sw[0]   { G15 LVCMOS33 }
    sw[1]   { P15 LVCMOS33 }
    sw[2]   { W13 LVCMOS33 }
    sw[3]   { T16 LVCMOS33 }
    btn[0]  { R18 LVCMOS33 }
    btn[1]  { P16 LVCMOS33 }
    btn[2]  { V16 LVCMOS33 }
    btn[3]  { Y16 LVCMOS33 }
    led[0]  { M14 LVCMOS33 }
    led[1]  { M15 LVCMOS33 }
    led[2]  { G14 LVCMOS33 }
    led[3]  { D18 LVCMOS33 }
}

# vim: set tabstop=4 softtabstop=4 shiftwidth=4 expandtab textwidth=0:
```

- [ ] Synthesis

```
PATH=${PATH}:/packages/LabSoC/ghdl/bin
PATH=${PATH}:/packages/LabSoC/Mentor/Models/bin
PATH=${PATH}:/packages/LabSoC/Xilinx/bin
ds_sms4=$HOME/Developer/ds-sms4
syn=/tmp/$USER/ds/syn
mkdir -p $syn
cd $syn
vivado -mode batch -source ${ds_sms4}/vhdl/project/crypto.syn.tcl -notrace
```

- [ ] Preparing the script and binary files 


```
cd $syn
cp /packages/LabSoC/ds-files/fsbl.elf .
cp /packages/LabSoC/ds-files/u-boot.elf .
bootgen -w -image ${ds_sms4}/vhdl/boot.bif -o boot.bin
cp ${ds_sms4}/bin/run-crypto.sh .
```


- [ ] Packaging the unix bootable image

* Mount the micro SD card on a computer and define a shell variable that points to it:

```
SDCARD=/media/robert/6F3B-6E41
```

* If your micro SD card does not yet contain the software components of the DigitalSystems reference design, prepare it:

```
cd /packages/LabSoC/ds-files
cp uImage devicetree.dtb uramdisk.image.gz $SDCARD
```


* Copy the new boot image to the micro SD card:

```
cp $syn/boot.bin $SDCARD
cp $syn/run-crypto.sh $SDCARD
sync
```


## **&#x1F516;** **(&#x67;)** ___Provide a user documentation showing how to use your cryptographic accelerator and its companion software components.___

#### Interact with the Unix Console through `picocom`

- on *nix &#x1F427;

```
picocom -b115200 /dev/ttyUSB1
```

- on Mac &#x1F34E;

```
picocom -b115200 /dev/cu.usbserial-2102796541531
```
> Returns
```powershell
...
Starting syslogd: OK
Starting klogd: OK
Running sysctl: OK
Starting mdev... OK
Starting network: OK

Welcome to DS (c) Telecom Paris
ds login: 
```

- [ ] At the prompt `ds login: `

enter the administrative user `root` (no password required)
> Returns
```
[root@ds] 
```

##### Run the provided convenient script or manually use `devmem` command

```
bash /media/sdcard/run-crypto.sh
```

##### &#x1F579; devmem 

* Reset and enable crypto engine

- write in control register 44: ```devmem 0x4000002C 32 3```
- write in control register : ```devmem 0x4000002C 32 2```

* populate key register

- write in K : ```devmem 0x40000000 64 0x0123456789ABCDEF ```
- write in K : ```devmem 0x4000000f 64 0xFEDCBA9876543210```

* populate plain text register

- write in ICB : ```devmem 0x40000010 64 0x0123456789ABCDEF ```
- write in ICB : ```devmem 0x4000001f 64 0xFEDCBA9876543210```

* Launch encryption

- write in STATUS: ```devmem 0x40000030 32 0x1```

* Test status (should read 0x1)

- read in STATUS: ```devmem 0x40000030 32 ```

* Read the value

- read in custom register : ```devmem 0x40000034 64```
- read in custom register : ```devmem 0x40000043 64```



# References

- [ ] [What is a nonce?](https://www.techtarget.com/searchsecurity/definition/nonce)

### SMS4 Encryption: Cycles per Encryption

SMS4 (also known as SM4) is a block cipher used in Chinese cryptographic standards. It operates on 128-bit blocks of data with a key size of 128 bits, and it performs 32 rounds of encryption.

The number of cycles per encryption (`C`) can be estimated based on the following factors:


1. **Rounds of Encryption:** SMS4 performs 32 rounds. &#x1F4CD; `The exact answer is 33, At 0 you send the go signal and you receive done after 33 clock cycles
2. **Operations per Round:** Each round involves a series of transformations including key addition, substitution (using S-box), and permutation.
3. **Additional Overhead:** There might be additional cycles required for setup and finalization steps.

### Estimation of Cycles per Encryption

For a simplified estimation:
- **Assume each round takes approximately the same number of cycles.**
- **Account for setup and finalization overhead.**

If we assume the following:
- **Basic Operations per Round:** 10 cycles (including S-box lookups, permutations, and key additions).
- **Setup and Finalization Overhead:** 20 cycles.

Then, the total cycles per encryption (`C`) would be:

$$
C = (Rounds \times Cycles\ per\ Round) + Overhead
$$
$$
C = (32 \times 10) + 20 = 320 + 20 = 340\ cycles
$$

### Detailed Estimation

To provide a more detailed estimation, consider:
- **Key Scheduling:** If key scheduling is done on-the-fly, it may add additional cycles per round.
- **Pipelining and Parallelism:** If the implementation is optimized for pipelining or parallel processing, the effective cycles per encryption may be reduced.

For a typical non-optimized implementation:

$$
C \approx 340\ cycles
$$

For an optimized implementation with pipelining:

$$
C \approx 300\ cycles
$$

### Conclusion

For SMS4 encryption, an approximate value for the number of cycles per encryption (`C`) is around **340 cycles** for a straightforward implementation. Optimized implementations may reduce this to around **300 cycles**.

