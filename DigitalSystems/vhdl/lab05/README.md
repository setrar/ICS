<!--
MASTER-ONLY: DO NOT MODIFY THIS FILE

Copyright © Telecom Paris
Copyright © Renaud Pacalet (renaud.pacalet@telecom-paris.fr)

This file must be used under the terms of the CeCILL. This source
file is licensed as described in the file COPYING, which you should
have received as part of this distribution. The terms are also
available at:
https://cecill.info/licences/Licence_CeCILL_V2.1-en.html
-->

Lab: a 3-stages re-synchronizer-edges-detector

---

[TOC]

---

# CODING CHALLENGE: 3-stages re-synchronizer and edges detector (20 minutes)

This challenge consists in designing a 3-stages re-synchronizer and detector of edges of a `data_in` input signal that comes from a different clock domain.

## Specifications

The entity is named `edge` and its architecture is named `rtl`.
Input-output ports:

| Name       | Type                            | Direction | Description                                                                  |
| :----      | :----                           | :----     | :----                                                                        |
| `clk`      | `std_ulogic`                    | in        | master clock, the design is synchronized on the rising edge of `clk`         |
| `sresetn`  | `std_ulogic`                    | in        | **synchronous**, active **low** reset                                        |
| `data_in`  | `std_ulogic`                    | in        | data input signal                                                            |
| `re`       | `std_ulogic`                    | out       | asserted **high** during 1 `clk` period when `data_in` rising edge detected  |
| `fe`       | `std_ulogic`                    | out       | asserted **high** during 1 `clk` period when `data_in` falling edge detected |

* The design is synchronized on the rising edge of `clk`.
* There is a 3-bits [shift register](../lab02/) used to re-synchronize the `data_in` input signal.
* `sresetn` is the **synchronous**, active **low** reset of the shift register.
* The `re` output is asserted high during one `clk` period when a rising transition of `data_in` is detected.
* The `fe` output is asserted high during one `clk` period when a falling transition of `data_in` is detected.

Warning: `data_in` must be synchronized by at least two stages of the shift register before it can be used in the `clk` clock domain; do not use the output of the first stage of the shift register, it could enter any time in a metastable state.
The following waveform shows the expected behaviour of `edge`.
Carefully study the latency between the edges of `data_in` and the effects on `re` and `fe`.

![`edge` waveform](../../images/edge_waveform.png)  
*Expected behaviour of `edge`*

## Schematic

As usual, before coding the VHDL model, draw a schematic of the digital hardware.

## VHDL coding

Edit the file named `edge.vhd`.
Code the `edge` entity and the `rtl` architecture.
Stick to your schematic, just translate it into VHDL.

## Validation

The provided simulation environment makes use of a random generation package (`rnd_pkg`) from a library named `common` that must be compiled first:

```bash
cd $sim
ghdl -a --std=08 --work=common $ds/vhdl/common/rnd_pkg.vhd
ghdl -a --std=08 $ds/vhdl/lab05/edge.vhd $ds/vhdl/lab05/edge_sim.vhd
ghdl -r --std=08 edge_sim --vcd=edge_sim.vcd
gtkwave edge_sim.vcd
```

Or:

```bash
cd $sim
vcom -2008 +acc -work common $ds/vhdl/common/rnd_pkg.vhd
vcom -2008 +acc $ds/vhdl/lab05/edge.vhd $ds/vhdl/lab05/edge_sim.vhd
vsim -voptargs="+acc" edge_sim
```

Or, if you use GNU `make` and `ghdl`:

```bash
cd $ds
make edge_sim.sim SIM=ghdl GUI=yes DIR="$sim"
```

Or, if you use GNU `make` and Modelsim:

```bash
cd $ds
make edge_sim.sim SIM=vsim GUI=yes DIR="$sim"
```

Note: you can edit the `local.mk` file at the root of the repository to change your preferences with GNU `make` and make the `SIM=ghdl GUI=yes DIR="$sim"` or `SIM=vsim GUI=yes DIR="$sim"` become the default.
Then, you can simulate with just:


```bash
cd $ds
make edge_sim.sim
```

and use the `SIM`, `GUI`, `DIR` variables only when they shall not be the default.
Example: if you defined `GUI` as `yes` in `local.mk` but you exceptionally want to simulate without the GUI:

```bash
cd $ds
make edge_sim.sim GUI=no
```

## Peer review

After the end of the challenge, compare your solution with your neighbours'.

[Entity instantiations]: ../../doc/data/entity-instantiations.md
[Zybo reference manual]: ../../doc/data/zybo_rm.pdf
[Zybo schematics]: ../../doc/data/zybo_sch.pdf
[Notifications]: https://gitlab.eurecom.fr/-/profile/notifications
[EURECOM GitLab web site]: https://gitlab.eurecom.fr/
[FAQ]: ../../FAQ.md

<!-- vim: set tabstop=4 softtabstop=4 shiftwidth=4 expandtab textwidth=0: -->
