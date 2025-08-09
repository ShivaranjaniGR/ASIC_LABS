create_clock -name clk -period 10 -waveform {0 5} [get_ports "clk"]

set_clock_transition -rise 0.1 [get_clocks "clk"]
set_clock_transition -fall 0.1 [get_clocks "clk"]
set_clock_uncertainty  0.1 [get_clocks "clk"]

set_input_delay -max 1.0 [get_ports "a_r"] - clock[get_clocks "clk"]
set_input_delay -max 1.0 [get_ports "b_r"] - clock[get_clocks "clk"]
set_input_delay -max 1.0 [get_ports "a_i"] - clock[get_clocks "clk"]
set_input_delay -max 1.0 [get_ports "b_i"] - clock[get_clocks "clk"]

set_output_delay -max 1.0 [get_ports "p_r"] -clock [get_clocks "clk"]
set_output_delay -max 1.0 [get_ports "p_i"] -clock [get_clocks "clk"]

