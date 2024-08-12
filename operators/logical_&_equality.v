module loeq();
reg [3:0] a,b,c,d,e,f;
initial 
begin 
a=4'b1010;
b=4'b10x1;
c=4'b1101;
d=4'b1101;
e=4'b0000;
f=4'b1101;
$display("a&&b=%b",a&&b);
$display("a||e=%b",a||e);
$display("f>=a=%b",f>=a);
$display("d>b=%b",d>b);
$display("b==c",(b==c));
$display("d==e=%b",d==e);
$display("a!=f=%b",a!=f);
$display("b===c=%b",b===c);
end 
endmodule 
