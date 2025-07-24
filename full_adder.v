
module full_adder (
    input wire clk,
    input wire rst,
    input wire a_in,
    input wire b_in,
    input wire cin_in,
    output reg sum_out,
    output reg cout_out
);

    // Input Registers
    reg a_reg, b_reg, cin_reg;

    // Intermediate signals
    wire sum1, carry1;
    wire sum2, carry2;

    // Register Inputs
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            a_reg   <= 0;
            b_reg   <= 0;
            cin_reg <= 0;
        end else begin
            a_reg   <= a_in;
            b_reg   <= b_in;
            cin_reg <= cin_in;
        end
    end

    // Instantiate first half adder: sum1, carry1
    half_adder ha1 (
        .a(a_reg),
        .b(b_reg),
        .sum(sum1),
        .carry(carry1)
    );

    // Instantiate second half adder: final sum, carry2
    half_adder ha2 (
        .a(sum1),
        .b(cin_reg),
        .sum(sum2),
        .carry(carry2)
    );

    // Final carry out
    wire cout_comb = carry1 | carry2;

    // Register Outputs
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            sum_out  <= 0;
            cout_out <= 0;
        end else begin
            sum_out  <= sum2;
            cout_out <= cout_comb;
        end
    end

endmodule
