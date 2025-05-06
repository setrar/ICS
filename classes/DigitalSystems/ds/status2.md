<!--
Copyright © Telecom Paris
Copyright © Renaud Pacalet (renaud.pacalet@telecom-paris.fr)

This file must be used under the terms of the CeCILL. This source
file is licensed as described in the file COPYING, which you should
have received as part of this distribution. The terms are also
available at:
https://cecill.info/licences/Licence_CeCILL_V2.1-en.html
-->

Second intermediate status check-list

Please fill the check list and add-commit push it. If you are late on some tasks, please try to catch up.

* [ ] Read the following parts of the [Free Range Factory] book:
   * [x] Chapter 6
   * [x] Chapter 7
   * [x] Chapter 8
   * [x] Chapter 9
* [ ] Read the following parts of the documentation:
   * [ ] [Unconstrained types]
   * [ ] [Recursivity]
   * [ ] [Protected types]
   * [ ] [Random numbers generation]
   * [ ] [Examining synthesis results]
* [ ] Complete the [DHT11 controller](vhdl/lab08)
  * [ ] Block diagram
  * [ ] State diagram
  * [ ] VHDL coding
  * [ ] Simulation, debugging, pass automatic evaluation
  * [ ] Synthesis and test on the Zybo
* [ ] Study the [AXI4 lite protocol specification]
  * [ ] Introduction of section A1.3 "_AXI Architecture_", page A1-22.
  * [ ] Section A3.1 "_Clock and reset_", page A3-36.
  * [ ] Section A3.2 "_Basic read and write transactions_", pages A3-37 to A3-39.
  * [ ] Section A3.3 "_Relationships between the channels_", pages A3-40 to A3-42.
  * [ ] Section A3.4.4 "_Read and write response structure_", pages A3-54 to A3-55.
  * [ ] Section B1.1 "_Definition of AXI4-Lite_", pages B1-122 to B1-123.
* [ ] Complete the [AXI4 wrapper for the DHT11 controller](vhdl/lab09)
  * [ ] Block diagram
  * [ ] State diagram
  * [ ] VHDL coding
  * [ ] Simulation, debugging, pass automatic evaluation
  * [ ] Synthesis and test on the Zybo

[Free Range Factory]: doc/data/free_range_vhdl.pdf
[VHDL simulation]: doc/data/vhdl-simulation.md
[Unconstrained types]: doc/data/unconstrained-types.md
[Recursivity]: doc/data/recursivity.md
[Protected types]: doc/data/protected-types.md
[Random numbers generation]: doc/data/random-numbers-generation.md
[Examining synthesis results]: doc/data/examining-synthesis-results.md
[AXI4 lite protocol specification]: doc/data/axi.pdf

<!-- vim: set tabstop=4 softtabstop=4 shiftwidth=4 expandtab textwidth=0: -->
