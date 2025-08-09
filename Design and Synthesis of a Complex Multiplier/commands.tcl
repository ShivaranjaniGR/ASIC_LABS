set_db library /home/install/FOUNDRY/digital/90nm/dig/lib/slow.lib
read_hdl {complex_mult_datapath.v complex_mult_fsm.v complex_multiplier_top.v}
elaborate
read_sdc con.g
syn_generic
set_db syn_map_effort high
syn_map
report timing
report area
report power
gui_show
write_hdl > complex_mul_net.v


