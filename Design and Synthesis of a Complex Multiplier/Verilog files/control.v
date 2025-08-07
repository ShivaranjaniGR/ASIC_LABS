`timescale 1ns/1ps
module control (clk,reset,input_rdy,a_sel, b_sel, pp1_ce, pp2_ce, sub,p_r_ce, p_i_ce);
input clk,reset, input_rdy;
output reg a_sel, b_sel, pp1_ce, pp2_ce, sub,p_r_ce, p_i_ce;

// one hot encoding of states
parameter [3:0]
step1 = 4'b0000,
step2 = 4'b0001,
step3 = 4'b0010,
step4 = 4'b0100,
step5 = 4'b1000;

//variable to hold the current state
reg [3:0] current_state;
  reg [3:0] next_state;

// setting up current state
always @ (posedge clk or posedge reset)
if (reset) current_state <= step1;
else current_state <= next_state;


// state transition block
always @ *
case (current_state)
step1 : if (input_rdy) next_state = step2;
else next_state = step1;
step2 : next_state = step3;
step3 : next_state = step4;
step4 : next_state = step5;
step5 : next_state = step1;

endcase

// output logic for each state
always @ *
case (current_state)
step1 :
begin
a_sel = 0; b_sel = 0; pp1_ce = 0;pp2_ce =0;p_r_ce =0 ; p_i_ce = 0;
end

step2 :
begin
a_sel = 1;b_sel = 1; pp1_ce = 0; pp2_ce =1 ; p_r_ce =0 ; p_i_ce = 0;
end

step3 :
begin
a_sel = 0; b_sel = 1; pp1_ce = 1; pp2_ce =0 ;sub=1; p_r_ce =1 ; p_i_ce = 0;
end

step4 :
begin
a_sel = 1; b_sel = 0; pp1_ce = 0; pp2_ce =1 ; p_r_ce =0 ;p_i_ce = 0;
end

step5 :
begin
 pp1_ce = 0; pp2_ce =0; sub=0; p_r_ce =0 ; p_i_ce = 1;
end

endcase

endmodule
