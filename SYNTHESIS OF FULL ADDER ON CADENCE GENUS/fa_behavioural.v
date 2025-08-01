module fa_behavioural (
    input wire clk,
    input wire rst,
    input wire a_in,
    input wire b_in,
    input wire cin_in,
    output reg sum_out,
    output reg cout_out
);


    reg a_reg, b_reg, cin_reg;


    reg sum_comb, cout_comb;


    always @(posedge clk or posedge rst) begin
        if (rst) begin
            a_reg   <= 1'b0;
            b_reg   <= 1'b0;
            cin_reg <= 1'b0;
        end else begin
            a_reg   <= a_in;
            b_reg   <= b_in;
            cin_reg <= cin_in;
        end
    end


    always @(*) begin
        {cout_comb, sum_comb} = a_reg + b_reg + cin_reg;
    end

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            sum_out  <= 1'b0;
            cout_out <= 1'b0;
        end else begin
            sum_out  <= sum_comb;
            cout_out <= cout_comb;
        end
    end

endmodule

