primitive udp_dlatch (q,d,clk,clr);
input d,clk,clr;
output reg q;
initial q=0;
table 
// d clk clr : q(ps):q(ns);

? ? 1:?:0;
? 0 0:?:-;
0 1 0:?:0;
1 1 0:?:1;
endtable 
endprimitive 

module test_primitive (q,d,clk,clr);
input d,clk,clr;
output  q;
udp_dlatch u2(q,d,clk,clr);
endmodule  

module test_dlatch ;
reg d,clk,clr;
wire q;

 test_primitive u0(q,d,clk,clr);
initial begin 
clr =1; clk=0; d=0;
#10 clr =0; 
#10 d=1;
# 10 clk=1;
#10 d=1;
#10 d=0;
end 
initial begin
 $monitor(" d=%b, clk=%d, clr=b, q=%b q+=%b ", d,clk,clr,q);
end 
endmodule 
