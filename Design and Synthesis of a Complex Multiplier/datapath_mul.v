`timescale 1ns/1ps
module datapath_mul (
    p_r, p_i,
    a_r, a_i, b_r, b_i,
    a_sel, b_sel, pp1_ce, pp2_ce, sub, p_r_ce, p_i_ce,
    clk);

    output reg [7 : -24] p_r, p_i;

    input [3 : -12] a_r, a_i, b_r, b_i;

    input a_sel, b_sel, pp1_ce, pp2_ce, sub, p_r_ce, p_i_ce;
    input clk;

    // The inputs are 16-bit signed fixed-point numbers (4 integer, 12 fractional)
    wire  [3:-12] a_input, b_input; 

    // Partial products should be a 32-bit signed fixed-point number (8 integer, 24 fractional)
    // The product of two 16-bit numbers is 32 bits.
    reg  [7 : -24] pp1, pp2; 
    wire  [7 : -24] sum; 
    wire  [7 : -24] pp; // Corrected width for pp wire

    // Select the a and b inputs
    assign a_input = a_sel ? a_i : a_r;
    assign b_input = b_sel ? b_i : b_r;

    // Perform the multiplication.
    // The product of a 16-bit signed value and a 16-bit signed value is a 32-bit signed value.
    // Verilog handles the sign extension implicitly.
    // The fixed-point multiplication needs to be handled correctly.
    // (a_input * b_input) is a 32-bit signed value.
    // The integer part is 4+4=8 bits, and the fractional part is 12+12=24 bits.
    // The result should fit in the [7:-24] format.
    assign pp = a_input * b_input;


    always @ (posedge clk) begin
        if (pp1_ce) begin
            pp1 <= pp;
        end
        if (pp2_ce) begin
            pp2 <= pp;
        end
    end

    assign sum = sub ? (pp1 - pp2) : (pp1 + pp2);

    always @ (posedge clk) begin
        if (p_r_ce) begin
            p_r <= sum;
        end
        if (p_i_ce) begin
            p_i <= sum;
        end
    end

endmodule
