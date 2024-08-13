primitive and_gate(y, a,b);
output y;
input a,b;
table 
/// a b :y ;
0 ? :0;
? 0 :0;
1 1 :1;
endtable 
endprimitive 

module test_udp (a,b,y);
input a,b;
output y;
and_gate u0(y,a,b);
endmodule 

module test_and;
reg a,b;
wire y;
integer i;
test_udp u1(a,b,y);
initial begin
for(i=0;i<4;i=i+1)
#10 {a,b}=i;
end 
initial begin
$monitor("m a=%b, b=%b, y=%b",a,b,y);
end 
endmodule 
