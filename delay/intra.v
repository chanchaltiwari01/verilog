////// intra assignmental delay /////
module intra (input signed [31:0] a, output integer b);
always @(a)begin
b=#3 a;
endmodule 

module testintra ;
reg signed [31:0] a;
wire  b;

  intra u0( .a(a),.b(b));
initial begin
  $monitor("value off a=%d, b=%d", $time ,a,b);
  a=3;
  #10;
  a=5;
 end 
endmodule 
