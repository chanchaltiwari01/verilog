module nor_gate(a,b,y);
input a,b;
output reg y;
 // assign y = ~ (a | b);
  
always @*
begin
if (a==0 && b==0) // if(a==1 || b==1)
y=1'b1;          // y=1'b0;
else             // else
y=1'b0;          //y=1'b1;
end
endmodule 

module test_nor ;
reg a,b;
wire y;

nor_gate u0(a,b,y);
initial begin
$monitor("a=%b,b=%b,y=%b",a,b,y);
a=0; b=0; #1;
a=1; b=0; #1;
a=0; b=1; #1;
a=1; b=1; #1;
end 
endmodule 
