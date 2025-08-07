`timescale 1ns/1ps
module top_module (
    input clk,
    input reset,
    input input_rdy,
    input  [3:-12] a_r, a_i, b_r, b_i,
    output  [7:-24] p_r, p_i
);

    // Wires to connect control and datapath
    wire a_sel, b_sel, pp1_ce, pp2_ce, sub, p_r_ce, p_i_ce;

    // Instantiate the control module
    control control_inst (
        .clk(clk),
        .reset(reset),
        .input_rdy(input_rdy),
        .a_sel(a_sel),
        .b_sel(b_sel),
        .pp1_ce(pp1_ce),
        .pp2_ce(pp2_ce),
        .sub(sub),
        .p_r_ce(p_r_ce),
        .p_i_ce(p_i_ce)
    );

    // Instantiate the datapath module
    datapath_mul datapath_inst (
        .p_r(p_r),
        .p_i(p_i),
        .a_r(a_r),
        .a_i(a_i),
        .b_r(b_r),
        .b_i(b_i),
        .a_sel(a_sel),
        .b_sel(b_sel),
        .pp1_ce(pp1_ce),
        .pp2_ce(pp2_ce),
        .sub(sub),
        .p_r_ce(p_r_ce),
        .p_i_ce(p_i_ce),
        .clk(clk)
    );

endmodule
