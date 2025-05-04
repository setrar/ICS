<!-- MASTER-ONLY: DO NOT MODIFY THIS FILE

Copyright © Telecom Paris
Copyright © Renaud Pacalet (renaud.pacalet@telecom-paris.fr)

This file must be used under the terms of the CeCILL. This source
file is licensed as described in the file COPYING, which you should
have received as part of this distribution. The terms are also
available at:
https://cecill.info/licences/Licence_CeCILL_V2.1-en.html
-->

Documentation

---

[TOC]

---

This folder contains documentation resources for the Digital Systems course.

## The VHDL language

### Slides of old VHDL course

- [Slides of old VHDL course](./data/vhdl_course.pdf)
- [Simulation exercise of old VHDL course](./data/vhdl_simulator_exercise.pdf)
- [Solutions of exercises of old VHDL course](./data/vhdl_exercise_solutions.pdf)

### VHDL book

- [The Free Range Factory VHDL book](./data/free_range_vhdl.pdf)

### VHDL features explained

- [Aggregate notation](./data/aggregate-notations.md)
- [Arithmetic: which types to use?](./data/arithmetic-which-types-to-use.md)
- [Comments](./data/comments.md)
- [D-flip-flops (DFF) and latches](./data/d-flip-flops-dff-and-latches.md)
- [Digital hardware design using VHDL in a nutshell](./data/digital-hardware-design-using-vhdl-in-a-nutshell.md)
- [Entity instantiations](./data/entity-instantiations.md)
- [Examining synthesis results](./data/examining-synthesis-results.md)
- [Generics](./data/generics.md)
- [Getting started with VHDL](./data/getting-started-with-vhdl.md)
- [How to implement a boolean function defined as a Look Up Table?](./data/how-to-implement-a-boolean-function-defined-as-a-look-up-table.md)
- [How to use text files to drive simulations?](./data/how-to-use-text-files-to-drive-simulations.md)
- [Identifiers](./data/identifiers.md)
- [Initial value declarations](./data/initial-values.md)
- [Protected types](./data/protected-types.md)
- [Random numbers generation](./data/random-numbers-generation.md)
- [Recursivity](./data/recursivity.md)
- [Resolution functions, unresolved and resolved types](./data/resolution-functions-unresolved-and-resolved-types.md)
- [`std_logic_1164`](./data/std_logic_1164.md)
- [Unconstrained types](./data/unconstrained-types.md)
- [VHDL simulation](./data/vhdl-simulation.md)
- [Wait](./data/wait.md)
- [Wait statements and sensitivity lists](./doc/data/wait-statement-in-a-process-with-sensitivity-list.md)

### The standard VHDL packages

The use of the `std` library and of the `std.standard` package are implicit in any VHDL code; there is no need to declare:

```vhdl
library std;
use std.standard.all;
```

All other libraries (except `work` which is also implicitly declared) and packages must be declared.

- `std` library:
  * [`standard`](./data/standard.vhd): defines base VHDL types
  * [`textio`](./data/textio.vhd): text files input/output
  * [`env`](./data/env.vhd): VHDL 2008 only, `finish` and `stop` procedures

- `ieee` library:
  * [`std_logic_1164`](./data/std_logic_1164.vhd) ([package body](./data/std_logic_1164-body.vhd)): defines the `std_ulogic` type, sub-types, vectors and overloads operators for them
  * [`numeric_bit`](./data/numeric_bit.vhd) ([package body](./data/numeric_bit-body.vhd)): defines `bit_vector`-like `unsigned` and `signed` types, overloads arithmetic operators for them
  * [`numeric_bit_unsigned`](./data/numeric_bit_unsigned.vhd) ([package body](./data/numeric_bit_unsigned-body.vhd)): overloads unsigned versions of arithmetic operators for `bit_vector` types
  * [`numeric_std`](./data/numeric_std.vhd) ([package body](./data/numeric_std-body.vhd)): defines `std_logic_vector`-like `unsigned` and `signed` types, overloads arithmetic operators for them
  * [`numeric_std_unsigned`](./data/numeric_std_unsigned.vhd) ([package body](./data/numeric_std_unsigned-body.vhd)) overloads unsigned versions of arithmetic operators for `std_ulogic_vector` and compatible types

## The Zybo board

* [The Zybo reference manual](./data/zybo_rm.pdf)
* [The Zybo schematics](./data/zybo_sch.pdf)

## GNU/Linux

- [Commands memento (English)](./data/command_memento.pdf)
- [Commands memento (German)](./data/command_memento_de.pdf)
- [Commands memento (French)](./data/command_memento_fr.pdf)
- [Commands memento (Italian)](./data/command_memento_it.pdf)

## Miscellaneous

* [The DHT11 sensor datasheet](./data/DHT11.pdf)
* [The AXI protocol specification](./data/axi.pdf)
* [The AXI stream protocol specification](./data/axi-stream.pdf)
* [The ProGit book](./data/ProGitScottChacon.pdf)

<!-- vim: set tabstop=4 softtabstop=4 shiftwidth=4 expandtab textwidth=0: -->
