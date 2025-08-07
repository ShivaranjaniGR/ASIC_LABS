//SUBMODULE HALF ADDER FOR FULL ADDER USING 2 HALF ADDERS
module half_adder (
    input wire a,
    input wire b,
    output wire sum,
    output wire carry
);
    assign sum = a ^ b;
    assign carry = a & b;
endmodule

