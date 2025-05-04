<!-- MASTER-ONLY: DO NOT MODIFY THIS FILE

Copyright © Telecom Paris
Copyright © Renaud Pacalet (renaud.pacalet@telecom-paris.fr)

This file must be used under the terms of the CeCILL. This source
file is licensed as described in the file COPYING, which you should
have received as part of this distribution. The terms are also
available at:
https://cecill.info/licences/Licence_CeCILL_V2.1-en.html
-->

How to implement a boolean function defined as a Look Up Table?

---

Sometimes boolean functions are defined as a Look Up Table (LUT) where the index is the input and the table content is the output.
Example: the AES block cipher uses a substitution box named SubBytes used to non-linearly transform bytes.
One of the definitions of SubBytes is in the form of a LUT:

```escape
<!                             y
       -----------------------------------------------
        0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
       -----------------------------------------------
  | 0 | 63 7c 77 7b f2 6b 6f c5 30 01 67 2b fe d7 ab 76 
  | 1 | ca 82 c9 7d fa 59 47 f0 ad d4 a2 af 9c a4 72 c0 
  | 2 | b7 fd 93 26 36 3f f7 cc 34 a5 e5 f1 71 d8 31 15 
  | 3 | 04 c7 23 c3 18 96 05 9a 07 12 80 e2 eb 27 b2 75 
  | 4 | 09 83 2c 1a 1b 6e 5a a0 52 3b d6 b3 29 e3 2f 84 
  | 5 | 53 d1 00 ed 20 fc b1 5b 6a cb be 39 4a 4c 58 cf 
  | 6 | d0 ef aa fb 43 4d 33 85 45 f9 02 7f 50 3c 9f a8 
  | 7 | 51 a3 40 8f 92 9d 38 f5 bc b6 da 21 10 ff f3 d2 
x | 8 | cd 0c 13 ec 5f 97 44 17 c4 a7 7e 3d 64 5d 19 73 
  | 9 | 60 81 4f dc 22 2a 90 88 46 ee b8 14 de 5e 0b db 
  | a | e0 32 3a 0a 49 06 24 5c c2 d3 ac 62 91 95 e4 79 
  | b | e7 c8 37 6d 8d d5 4e a9 6c 56 f4 ea 65 7a ae 08 
  | c | ba 78 25 2e 1c a6 b4 c6 e8 dd 74 1f 4b bd 8b 8a 
  | d | 70 3e b5 66 48 03 f6 0e 61 35 57 b9 86 c1 1d 9e 
  | e | e1 f8 98 11 69 d9 8e 94 9b 1e 87 e9 ce 55 28 df 
  | f | 8c a1 89 0d bf e6 42 68 41 99 2d 0f b0 54 bb 16

Figure 7. S-box: substitution values for the byte xy (in hexadecimal format).!>
```

One easy way to implement this is to use the same tabular form in VHDL:

```vhdl
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std_unsigned.all;

package aes_pkg is

    subtype aes_w8_t   is std_ulogic_vector(0 to   7);

    function aes_sbox(v: aes_w8_t) return aes_w8_t;

end package aes_pkg;

package body aes_pkg is

    type aes_sbox_t is array (natural range 0 to 255) of aes_w8_t;

    constant aes_sbox_c: aes_sbox_t := (
        x"63", x"7c", x"77", x"7b", x"f2", x"6b", x"6f", x"c5", x"30", x"01", x"67", x"2b", x"fe", x"d7", x"ab", x"76",
        x"ca", x"82", x"c9", x"7d", x"fa", x"59", x"47", x"f0", x"ad", x"d4", x"a2", x"af", x"9c", x"a4", x"72", x"c0",
        x"b7", x"fd", x"93", x"26", x"36", x"3f", x"f7", x"cc", x"34", x"a5", x"e5", x"f1", x"71", x"d8", x"31", x"15",
        x"04", x"c7", x"23", x"c3", x"18", x"96", x"05", x"9a", x"07", x"12", x"80", x"e2", x"eb", x"27", x"b2", x"75",
        x"09", x"83", x"2c", x"1a", x"1b", x"6e", x"5a", x"a0", x"52", x"3b", x"d6", x"b3", x"29", x"e3", x"2f", x"84",
        x"53", x"d1", x"00", x"ed", x"20", x"fc", x"b1", x"5b", x"6a", x"cb", x"be", x"39", x"4a", x"4c", x"58", x"cf",
        x"d0", x"ef", x"aa", x"fb", x"43", x"4d", x"33", x"85", x"45", x"f9", x"02", x"7f", x"50", x"3c", x"9f", x"a8",
        x"51", x"a3", x"40", x"8f", x"92", x"9d", x"38", x"f5", x"bc", x"b6", x"da", x"21", x"10", x"ff", x"f3", x"d2",
        x"cd", x"0c", x"13", x"ec", x"5f", x"97", x"44", x"17", x"c4", x"a7", x"7e", x"3d", x"64", x"5d", x"19", x"73",
        x"60", x"81", x"4f", x"dc", x"22", x"2a", x"90", x"88", x"46", x"ee", x"b8", x"14", x"de", x"5e", x"0b", x"db",
        x"e0", x"32", x"3a", x"0a", x"49", x"06", x"24", x"5c", x"c2", x"d3", x"ac", x"62", x"91", x"95", x"e4", x"79",
        x"e7", x"c8", x"37", x"6d", x"8d", x"d5", x"4e", x"a9", x"6c", x"56", x"f4", x"ea", x"65", x"7a", x"ae", x"08",
        x"ba", x"78", x"25", x"2e", x"1c", x"a6", x"b4", x"c6", x"e8", x"dd", x"74", x"1f", x"4b", x"bd", x"8b", x"8a",
        x"70", x"3e", x"b5", x"66", x"48", x"03", x"f6", x"0e", x"61", x"35", x"57", x"b9", x"86", x"c1", x"1d", x"9e",
        x"e1", x"f8", x"98", x"11", x"69", x"d9", x"8e", x"94", x"9b", x"1e", x"87", x"e9", x"ce", x"55", x"28", x"df",
        x"8c", x"a1", x"89", x"0d", x"bf", x"e6", x"42", x"68", x"41", x"99", x"2d", x"0f", x"b0", x"54", x"bb", x"16"
    );

    function aes_sbox(v: aes_w8_t) return aes_w8_t is
    begin
        return aes_sbox_c(to_integer(v));
    end function aes_sbox;

end package body aes_pkg;
```

The logic synthesizer will do its best to transform this in a network of logic gates with the same function.
In some cases it can also implement this with one kind or another of memory if it is more efficient in terms of speed or resources usage.
Of course the obtained performance (speed, resources usage) depends on the function itself, and it is difficult to predict before trying.

<!-- vim: set tabstop=4 softtabstop=4 shiftwidth=4 expandtab textwidth=0: -->
