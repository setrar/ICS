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
#

set_msg_config -id {[Board 49-26]} -severity WARNING -suppress
set_msg_config -id {[Designutils 20-3303]} -severity WARNING -suppress
set_msg_config -id {[IP_Flow 19-240]} -severity WARNING -suppress
set_msg_config -id {[IP_Flow 19-5098]} -severity {CRITICAL WARNING} -new_severity WARNING
set_msg_config -id {[IP_Flow 19-5655]} -severity {CRITICAL WARNING} -new_severity WARNING
set_msg_config -id {[IP_Flow 19-11770]} -severity WARNING -suppress
set_msg_config -id {[Opt 31-1131]} -severity WARNING -suppress
set_msg_config -id {[PSU-} -severity {CRITICAL WARNING} -string "PS DDR interfaces might fail when entering negative DQS skew values" -suppress
set_msg_config -id {[Synth 8-7080]} -severity WARNING -suppress
set_msg_config -id {[Vivado_Tcl 4-921]} -severity WARNING -suppress

set board [get_board_parts digilentinc.com:zybo:part0:1.0]
set part xc7z010clg400-1

proc usage {} {
    puts "
usage: vivado -mode batch -source <script>
    <script>: TCL script"
    exit -1
}

set script [file normalize [info script]]
set lab [file dirname $script]
set vhdl [file dirname $lab]
regsub {\..*} [file tail $script] "" design
set params $lab/$design.params.tcl

if [file exists $params] {
    source $params
} else {
    puts "
Error: parameter file $params not found. Aborting."
    exit -1
}

if { $argc != 0 } {
    usage
}

puts "*********************************************"
puts "Summary of build parameters"
puts "*********************************************"
puts "Board: $board"
puts "Part: $part"
puts "Root directory: $vhdl"
puts "Design name: $design"
puts "Frequency: $f_mhz MHz"
puts "Start delay: $start_us µs"
puts "Warm-up delay: $warm_us µs"
puts "*********************************************"

#############
# Create IP #
#############
create_project -part $part $design $design
set_property board_part $board [current_project]
foreach {du lib} [array get dus] {
    read_vhdl -vhdl2008 -library $lib $vhdl/$du
}
ipx::package_project -force_update_compile_order -import_files -root_dir $design -vendor www.telecom-paris.fr -library DS -force $design
close_project

###########################
# Create top level design #
###########################
set top ${design}_top
set_part $part
set_property board_part $board [current_project]
set_property ip_repo_paths [list ./$design] [current_fileset]
update_ip_catalog
create_bd_design $top
set ip [create_bd_cell -type ip -vlnv [get_ipdefs *www.telecom-paris.fr:DS:$design:*] $design]
set_property -dict [list CONFIG.f_mhz $f_mhz CONFIG.start_us $start_us CONFIG.warm_us $warm_us] $ip
set ps7 [create_bd_cell -type ip -vlnv [get_ipdefs *xilinx.com:ip:processing_system7:*] ps7]
apply_bd_automation -rule xilinx.com:bd_rule:processing_system7 -config {make_external "FIXED_IO, DDR" apply_board_preset "1" Master "Disable" Slave "Disable" } $ps7
set_property -dict [list CONFIG.PCW_FPGA0_PERIPHERAL_FREQMHZ $f_mhz] $ps7
set_property -dict [list CONFIG.PCW_USE_M_AXI_GP0 {1}] $ps7
set_property -dict [list CONFIG.PCW_M_AXI_GP0_ENABLE_STATIC_REMAP {1}] $ps7
# set_property -dict [list CONFIG.PCW_USE_FABRIC_INTERRUPT {1} CONFIG.PCW_IRQ_F2P_INTR {1}] [get_bd_cells ps7]

# Interconnections
# Primary IOs
create_bd_port -dir IO -type data data
connect_bd_net [get_bd_pins $ip/data] [get_bd_ports data]
create_bd_port -dir O -type data -from 3 -to 0 led
connect_bd_net [get_bd_pins $ip/led] [get_bd_ports led]
# ps7 - ip
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config {Master "/ps7/M_AXI_GP0" Clk "Auto" }  [get_bd_intf_pins /$ip/s0_axi]
# connect_bd_net [get_bd_pins /$ip/irq] [get_bd_pins ps7/IRQ_F2P]

# Addresses ranges
set_property offset 0x40000000 [get_bd_addr_segs -of_object [get_bd_intf_pins /ps7/M_AXI_GP0]]
set_property range 4K [get_bd_addr_segs -of_object [get_bd_intf_pins /ps7/M_AXI_GP0]]

# Synthesis flow
validate_bd_design
save_bd_design
generate_target all [get_files $top.bd]
make_wrapper -top [get_files $top.bd] -import -force
synth_design -top $top

# IOs
foreach io [ array names ios ] {
    set pin [ lindex $ios($io) 0 ]
    set std [ lindex $ios($io) 1 ]
    set_property package_pin $pin [get_ports $io]
    set_property iostandard $std [get_ports [list $io]]
}

# Clocks and timing
set clock [get_clocks]
set_false_path -from $clock -to [get_ports data]
set_false_path -from $clock -to [get_ports led[*]]
set_false_path -from [get_ports data] -to $clock

# Implementation
opt_design
place_design
route_design

# Reports
report_utilization -force -file $design.utilization.rpt
report_utilization -hierarchical -force -file $design.utilization.hierarchical.rpt
report_timing_summary -file $design.timing.rpt

# Bitstream
write_bitstream -force $design
write_hw_platform -fixed -file $design.xsa

# Messages
puts ""
puts "*********************************************"
puts "\[VIVADO\]: done"
puts "*********************************************"
puts "Summary of build parameters"
puts "*********************************************"
puts "Board: $board"
puts "Part: $part"
puts "Root directory: $vhdl"
puts "Design name: $design"
puts "Frequency: $f_mhz MHz"
puts "Start delay: $start_us µs"
puts "Warm-up delay: $warm_us µs"
puts "*********************************************"
puts "  bitstream in $design.bit"
puts "  hardware definition file in $design.xsa"
puts "  flat resource utilization report in $design.utilization.rpt"
puts "  hierarchical resource utilization report in $design.utilization.hierarchical.rpt"
puts "  timing report in $design.timing.rpt"
puts "*********************************************"

# Quit
quit

# vim: set tabstop=4 softtabstop=4 shiftwidth=4 expandtab textwidth=0:
