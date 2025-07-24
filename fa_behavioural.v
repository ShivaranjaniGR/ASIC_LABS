module fa_behavioural(cout,s,a,b,c,clk);
input a,b,c,clk;
output reg cout,s;
reg a_1,b_1,c_in;
wire s_1,c_1;
always @(posedge clk)
begin
a_1 <= a;
b_1 <=b;
c_in <=c;
end
assign s_1 = a_1^b_1^c_in;
assign c_1 = (a_1 & b_1)|(b_1 & c_in)|(a_1 & c_in);
always @(posedge clk)
begin
s <= s_1;
cout <= c_1;
end
endmodule

