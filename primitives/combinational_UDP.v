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
//////////////////////////////////////////////////////////////////////////////////
primitive xor_gate_udp(s,a,b);
input a,b;
output s;
table 

// a b :s;
0 0: 0;
0 1: 1;
1 0: 1;
1 1: 0;
endtable 
endprimitive
////////////////////////////////////////////////////////////////////////
module half_adder(a,b,sum,carry);
input a,b;
output  sum,carry;
xor_gate_udp u0(sum ,a,b);
and_gate u1(carry,a,b);
endmodule 

module test_half_adder;
reg a,b;
wire y;
integer i;
half_adder u0(a,b,sum,carry);
initial begin
for(i=0;i<4;i=i+1)
#10 {a,b}=i;
end 
initial begin
$monitor("m a=%b, b=%b, sum=%b, carry=%b",a,b,sum, carry);
end 
endmodule 

















