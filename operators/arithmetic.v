module air();
reg [3:0] a,b,c;
integer d,e,f,g;
initial 
begin 
a=4'b0010;
b=4'b1101;
c=4'b10x1;
d=2;
e=5;
f=2;
g=5;
$display("a+b=%b",a+b);
$display("a-c=%b",a-c);
$display("b-a=%b",b-a);
$display("a*b=%b",a*b);
$display("d+e=%d",d+e);
$display("e/d=%d",e/d);
$display("e**f=%d",e**f);
$display("ed=%d",e%d); // reminder %d is know as decimal and another of %d use for modulas 
end 
endmodule 
