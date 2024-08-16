module xor_gate(a,b,y);
input a,b ;
output reg y;
  
//assign y = a ^ b ;
  
always @*begin
if (a!=b)
y=1'b1;
else
y=1'b0;
end 
endmodule 

module  test_xor;
reg a,b;
wire y;

xor_gate u0(.a(a),.b(b),.y(y));
initial begin 
a=1'bx; b=1'b0; #1;
a=1'b1; b=1'bx; #1;
a=1'b0; b=1'b0; #1;
a=1'b0; b=1'b1; #1;
a=1'b1; b=1'b0; #1;
a=1'b1; b=1'b1; #1;
end 
initial begin
$monitor("a=%b,b=%b,y=%b", a,b,y);
end 
endmodule 
