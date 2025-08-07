`timescale 1ns/1ps


module streaming_tb;



// Parameters for fixed-point representation


parameter INT_BITS = 4;


parameter FRAC_BITS = 12;



// Testbench signals


reg clk;


reg reset;


reg input_rdy;


reg  [3:-12] a_r_tb, a_i_tb, b_r_tb, b_i_tb;


wire  [7:-24] p_r_tb, p_i_tb;


// Internal counters and data storage


reg [2:0] test_case_counter;


reg [3:-12] a_r_mem [0:5];


reg [3:-12] a_i_mem [0:5];


reg [3:-12] b_r_mem [0:5];


reg [3:-12] b_i_mem [0:5];


// Instantiate the top module


top_module uut (


.clk(clk),


.reset(reset),


.input_rdy(input_rdy),


.a_r(a_r_tb),


.a_i(a_i_tb),


.b_r(b_r_tb),


.b_i(b_i_tb),


.p_r(p_r_tb),


.p_i(p_i_tb)


);



// Clock generation


initial begin


clk = 0;


forever #5 clk = ~clk; // 10ns period


end


// Store input data in arrays


initial begin


// Test 1: (2+j1) * (3+j4)


a_r_mem[0] = {4'b0010, 12'd0};


a_i_mem[0] = {4'b0001, 12'd0};


b_r_mem[0] = {4'b0011, 12'd0};


b_i_mem[0] = {4'b0100, 12'd0};


// Test 2: (1+j1) * (3+j2)


a_r_mem[1] = {4'b0001, 12'd0};


a_i_mem[1] = {4'b0001, 12'd0};


b_r_mem[1] = {4'b0011, 12'd0};


b_i_mem[1] = {4'b0010, 12'd0};


// Test 3: (0.5+j0.25) * (0.5+j0.25)


a_r_mem[2] = {4'b0000, 12'd2048};


a_i_mem[2] = {4'b0000, 12'd1024};


b_r_mem[2] = {4'b0000, 12'd2048};


b_i_mem[2] = {4'b0000, 12'd1024};


// Test 4: (0.5+j0.5) * (1.5+j0.5)


a_r_mem[3] = {4'b0000, 12'd2048};


a_i_mem[3] = {4'b0000, 12'd2048};


b_r_mem[3] = {4'b0001, 12'd2048};


b_i_mem[3] = {4'b0000, 12'd2048};


// Test 5: (5+j0) * (0+j10)


a_r_mem[4] = {4'b0101, 12'd0};


a_i_mem[4] = 0;


b_r_mem[4] = 0;


b_i_mem[4] = {4'b1010, 12'd0};


// Test 6: (6+j5) * (7+j8)


a_r_mem[5] = {4'b0110, 12'd0};


a_i_mem[5] = {4'b0101, 12'd0};


b_r_mem[5] = {4'b0111, 12'd0};


b_i_mem[5] = {4'b1000, 12'd0};


end



// Test sequence


initial begin


$dumpfile("streaming_tb.vcd");


$dumpvars(0, streaming_tb);



// Initialize signals


reset = 1;


input_rdy = 0;


a_r_tb = 0; a_i_tb = 0; b_r_tb = 0; b_i_tb = 0;


test_case_counter = 0;



#10;


reset = 0;


#10;



$display("--------------------------------------------------");


$display("Starting streaming testbench...");


$display("--------------------------------------------------");


// Loop to provide inputs one by one


repeat (6) begin


$display("Sending input for Test Case %0d...", test_case_counter + 1);


// Apply current test case inputs


a_r_tb = a_r_mem[test_case_counter];


a_i_tb = a_i_mem[test_case_counter];


b_r_tb = b_r_mem[test_case_counter];


b_i_tb = b_i_mem[test_case_counter];



// Assert input_rdy for one cycle


input_rdy = 1;


#10;


input_rdy = 0;



test_case_counter = test_case_counter + 1;


// Wait for one computation to pass through the pipeline


// Our pipeline takes 4 cycles to get p_r, so we wait 4 clocks.


#40;


// Display the result


$display("Result p_r for Test Case %0d = %f", test_case_counter, $itor(p_r_tb) / 4096.0);


$display("--------------------------------------------------");


end



// After all inputs have been sent, wait for the last results to come out


$display("All inputs sent. Waiting for the final results to flush...");


#40; // Wait for the last p_r result (from test 6)


$display("Result p_r for Test Case %0d = %f", 6, $itor(p_r_tb) / 4096.0);


$display("--------------------------------------------------");


#100;


$finish;


end

endmodule 
