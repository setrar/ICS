# MASTER-ONLY: DO NOT MODIFY THIS FILE
#
# Copyright © Telecom Paris
# Copyright © Renaud Pacalet (renaud.pacalet@telecom-paris.fr)
#
# This file must be used under the terms of the CeCILL. This source
# file is licensed as described in the file COPYING, which you should
# have received as part of this distribution. The terms are also
# available at:
# https://cecill.info/licences/Licence_CeCILL_V2.1-en.html

dht11_ctrl_axi_wrapper: unisim axi_pkg dht11_ctrl
dht11_ctrl_axi_wrapper_sim: rnd_pkg utils_pkg dht11 dht11_ctrl_axi_wrapper
