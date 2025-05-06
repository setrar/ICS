<!--
Copyright © Telecom Paris
Copyright © Renaud Pacalet (renaud.pacalet@telecom-paris.fr)

This file must be used under the terms of the CeCILL. This source
file is licensed as described in the file COPYING, which you should
have received as part of this distribution. The terms are also
available at:
https://cecill.info/licences/Licence_CeCILL_V2.1-en.html
-->

First intermediate status check-list

Please fill the check list and add-commit push it. If you are late on some tasks, please try to catch up.

* [x] Get a Zybo prototyping board
* [x] Fill the `zybo.md` file, add-commit-push it
* [x] Learn enough of `git` (e.g. by reading the [ProGit book]) for our needs in the labs
* [x] Learn enough of Markdown (e.g. on [Daring Fireball] or the [Markdown tutorial]) for our needs in the labs
* [ ] Read the following parts of the [Free Range Factory] book:
   * [x] Chapter 1
   * [X] Chapter 2
   * [X] Chapter 3
   * [X] Chapter 4
   * [X] Chapter 5
   * [ ] Section 10.4 -- I can't find these section in Chapter 10
   * [ ] Section 10.8 -- I can't find these section in Chapter 10
* [ ] Read the following parts of the documentation:
   * [ ] [Digital hardware design using VHDL in a nutshell]
   * [ ] [Getting started with VHDL]
   * [ ] [VHDL simulation]
   * [ ] [The `ieee.std_logic_1164` package]
   * [ ] [Generic parameters]
   * [ ] [Aggregate notations]
   * [ ] [Comments]
   * [ ] [Identifiers]
   * [ ] [Wait statements]
   * [ ] [Initial values declarations]
   * [ ] [D-flip-flops (DFF) and latches]
   * [ ] [Arithmetic: which types to use?]
   * [ ] [Entity instantiations]
   * [ ] [Resolution functions, unresolved and resolved types]
* [x] Complete [the continuity tester](vhdl/lab01)
   * [x] Write the VHDL model of the continuity tester for our jumper wires
   * [x] Write a simulation environment, simulate, debug, validate using GHDL or Siemens Modelsim
   * [x] Pass the automatic evaluation
   * [x] Synthesize
   * [x] Test on the Zybo board
   * [x] Write your report
* [ ] Complete [the shift register](vhdl/lab02)
   * [x] Write the VHDL model of the shift register
   * [x] Use the provided simulation environment to simulate, debug and validate using GHDL or Siemens Modelsim
   * [x] Pass the automatic evaluation
   * [x] Write your report
* [ ] Complete [the timer](vhdl/lab03)
   * [ ] Write the VHDL model of the timer
   * [ ] Use the provided simulation environment to simulate, debug and validate using GHDL or Siemens Modelsim
   * [ ] Pass the automatic evaluation
   * [ ] Write your report
* [ ] Complete [the LED blinker](vhdl/lab04)
   * [ ] Write the VHDL model of the LED blinker
   * [ ] Use the provided simulation environment to simulate, debug and validate using GHDL or Siemens Modelsim
   * [ ] Pass the automatic evaluation
   * [ ] Synthesize the LED blinker
   * [ ] Test on the Zybo board
   * [ ] Write your report
* [ ] Complete [the edge detector](vhdl/lab05)
   * [ ] Write the VHDL model of the re-synchronizer / edges detector
   * [ ] Use the provided simulation environment to simulate, debug and validate using GHDL or Siemens Modelsim
   * [ ] Pass the automatic evaluation
   * [ ] Write your report
* [ ] Complete [the counter](vhdl/lab06)
   * [ ] Write the VHDL model of the counter
   * [ ] Use the provided simulation environment to simulate, debug and validate using GHDL or Siemens Modelsim
   * [ ] Pass the automatic evaluation
   * [ ] Write your report
* [ ] Complete [the edge counter](vhdl/lab07)
   * [ ] Write the VHDL model of the edge counter
   * [ ] Use the provided simulation environment to simulate, debug and validate using GHDL or Siemens Modelsim
   * [ ] Pass the automatic evaluation
   * [ ] Synthesize the edge counter
   * [ ] Test on the Zybo board
   * [ ] Write your report
* [ ] Read the [DHT11 sensor datasheet]

[ProGit book]: doc/data/ProGitScottChacon.pdf
[Daring Fireball]: https://daringfireball.net/projects/markdown/syntax
[Markdown tutorial]: http://www.markdowntutorial.com/
[Free Range Factory]: doc/data/free_range_vhdl.pdf
[Getting started with VHDL]: doc/data/getting-started-with-vhdl.md
[Digital hardware design using VHDL in a nutshell]: doc/data/digital-hardware-design-using-vhdl-in-a-nutshell.md
[VHDL simulation]: doc/data/vhdl-simulation.md
[Comments]: doc/data/comments.md
[Identifiers]: doc/data/identifiers.md
[Wait statements]: doc/data/wait.md
[The `ieee.std_logic_1164` package]: doc/data/std_logic_1164.md
[Generic parameters]: doc/data/generics.md
[Aggregate notations]: doc/data/aggregate-notations.md
[Resolution functions, unresolved and resolved types]: doc/data/resolution-functions-unresolved-and-resolved-types.md
[Entity instantiations]: doc/data/entity-instantiations.md
[Initial values declarations]: doc/data/initial-values.md
[D-flip-flops (DFF) and latches]: doc/data/d-flip-flops-dff-and-latches.md
[Arithmetic: which types to use?]: doc/data/arithmetic-which-types-to-use.md
[DHT11 sensor datasheet]: doc/data/DHT11.pdf

<!-- vim: set tabstop=4 softtabstop=4 shiftwidth=4 expandtab textwidth=0: -->
