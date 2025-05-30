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
