
`timescale 1 ns / 1ns
module fa_asic1_tb5;
reg a,b,c,clk;
wire s,cout;
fa_asic1 uut1(cout,s,a,b,c,clk);
initial clk=0;
initial
begin
a=0;b=0;c=0;
#10 a=0;b=0;c=1;
#10 a=0;b=1;c=1;
#10 a=0;b=1;c=0;
#10 a=1;b=1;c=0;
#10 a=1;b=1;c=1;
#10 a=1;b=0;c=1;
#10 a=1;b=0;c=0;
#200 $finish;
end
initial
begin
$dumpfile ("addertb5.vcd");
$dumpvars (0, fa_asic1_tb5);
end
always #1 clk =~clk;
endmodule
