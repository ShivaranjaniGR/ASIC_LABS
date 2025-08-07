set_db library /home/install/FOUNDRY/digital/180nm/dig/lib/slow.lib
read_hdl fa_asic1.v
elaborate
read_sdc fa1.g
read_vcd fa_asic1_tb3.vcd 
set_db syn_generic_effort high
set_db syn_map_effort high
syn_generic
syn_map
write_netlist > adder3_netlist.v
write_sdc > adder3.sdc
gui_show
report_power > adder3_power.rpt
report_area > adder3_area.rpt

set_db library /home/install/FOUNDRY/digital/180nm/dig/lib/slow.lib
read_hdl fa_asic1.v
elaborate
read_sdc fa1.g
read_vcd fa_asic1_tb4.vcd 
set_db syn_generic_effort high
set_db syn_map_effort high
syn_generic
syn_map
write_netlist > adder4_netlist.v
write_sdc > adder4.sdc
gui_show
report_power > adder4_power.rpt
report_area > adder4_area.rpt


set_db library /home/install/FOUNDRY/digital/180nm/dig/lib/slow.lib
read_hdl fa_asic1.v
elaborate
read_sdc fa1.g
read_vcd fa_asic1_tb5.vcd 
set_db syn_generic_effort high
set_db syn_map_effort high
syn_generic
syn_map
write_netlist > adder5_netlist.v
write_sdc > adder5.sdc
gui_show
report_power > adder5_power.rpt
report_area > adder5_area.rpt
