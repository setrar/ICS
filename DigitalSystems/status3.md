<!--
Copyright © Telecom Paris
Copyright © Renaud Pacalet (renaud.pacalet@telecom-paris.fr)

This file must be used under the terms of the CeCILL. This source
file is licensed as described in the file COPYING, which you should
have received as part of this distribution. The terms are also
available at:
https://cecill.info/licences/Licence_CeCILL_V2.1-en.html
-->

Third intermediate status check-list

Please fill the check list and add-commit push it. If you are late on some tasks, please try to catch up.

* [ ] Read the following parts of the [Free Range Factory] book:
   * [ ] Chapter 10
   * [ ] Chapter 11
   * [ ] Chapter 12
   * [ ] Appendix B
   * [ ] Appendix C
* [ ] Complete the [Linux device driver for the DHT11 controller](vhdl/lab10)
   * [ ] Generate and compile the device tree
   * [ ] Configure and compile the Linux kernel
   * [ ] Understand and adapt the provided Linux driver and example software application
   * [ ] Compile the Linux driver and the example software application
         If there are errors when compiling the driver on EURECOM computers please use the provided binary: `/packages/LabSoC/ds-files/dht11_driver.ko`.
   * [ ] Test on the Zybo board
   * [ ] Write your report
* [ ] Complete the `crypto_pkg` package for your crypto algorithm and validate it against reliable test vectors.

[Free Range Factory]: doc/data/free_range_vhdl.pdf

<!-- vim: set tabstop=4 softtabstop=4 shiftwidth=4 expandtab textwidth=0: -->
