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
set f_mhz 125

# list of design units: FILE LIBRARY (paths relative to vhdl/)
array set dus {
    lab02/sr.vhd      work
    lab05/edge.vhd    work
    lab06/counter.vhd work
    lab07/ec.vhd      work
}

# list of external ports: NAME { PIN IO_STANDARD }
array set ios {
    clk    { L16 LVCMOS33 }
    areset { R18 LVCMOS33 }
    btn    { Y16 LVCMOS33 }
    led[0] { M14 LVCMOS33 }
    led[1] { M15 LVCMOS33 }
    led[2] { G14 LVCMOS33 }
    led[3] { D18 LVCMOS33 }
}

# vim: set tabstop=4 softtabstop=4 shiftwidth=4 expandtab textwidth=0:
