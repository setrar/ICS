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

# Interconnections
# Primary IOs
create_bd_port -dir I -type clk -freq_hz [expr 1000000 * $f_mhz] clk
connect_bd_net [get_bd_pins $ip/clk] [get_bd_ports clk]
create_bd_port -dir I areset
connect_bd_net [get_bd_pins $ip/areset] [get_bd_ports areset]
create_bd_port -dir IO -type data data
connect_bd_net [get_bd_pins $ip/data] [get_bd_ports data]
create_bd_port -dir I -type data -from 1 -to 0 sw
connect_bd_net [get_bd_pins $ip/sw] [get_bd_ports sw]
create_bd_port -dir O -type data -from 3 -to 0 led
connect_bd_net [get_bd_pins $ip/led] [get_bd_ports led]

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
create_clock -name clk -period [expr 1000.0 / $f_mhz] [get_ports clk]
set_false_path -from clk -to [get_ports led[*]]
set_false_path -from clk -to [get_ports data]
set_false_path -from [get_ports areset] -to clk
set_false_path -from [get_ports data] -to clk
set_false_path -from [get_ports sw[*]] -to clk

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
puts "*********************************************"
puts "  bitstream in $design.bit"
puts "  flat resource utilization report in $design.utilization.rpt"
puts "  hierarchical resource utilization report in $design.utilization.hierarchical.rpt"
puts "  timing report in $design.timing.rpt"
puts "*********************************************"

# Quit
quit

# vim: set tabstop=4 softtabstop=4 shiftwidth=4 expandtab textwidth=0:
