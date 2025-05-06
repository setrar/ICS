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
    crypto/crypto_pkg.vhd    work
    crypto/crypto_engine.vhd work
    crypto/crypto_tests.vhd  work
}

# list of external ports: NAME { PIN IO_STANDARD }
array set ios {
    clk     { L16 LVCMOS33 }
    sresetn { V12 LVCMOS33 }
    shift   { W16 LVCMOS33 }
    go      { J15 LVCMOS33 }
    din     { H15 LVCMOS33 }
    dout    { V13 LVCMOS33 }
}

# vim: set tabstop=4 softtabstop=4 shiftwidth=4 expandtab textwidth=0:
