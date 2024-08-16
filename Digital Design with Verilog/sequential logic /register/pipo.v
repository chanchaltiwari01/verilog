// pipo (parallel in parallel out shift  register)
 
 module pipo(
    input [3:0] din,
	input clk,rst,
   output reg [3:0] q);

always@(posedge clk)
  begin
  if(rst)
  q <= 4'b0000;
  else 
  q <= din;
 end 
endmodule 


module test_pipo;
  reg [3:0] din;
  reg clk=1'b0,rst;
  wire [3:0] q;
  
  pipo u0(.din(din),.clk(clk),.rst(rst),.q(q));
  
  always #5 clk = ~clk;
  initial begin
  $dumpfile("dump.vcd");
        $dumpvars(1);
  $monitor("clk=%b,rst=%b,din=%b,q=%b",clk,rst,din,q);
  rst=1; din=4'b0101; #10;
  rst=0 ; #10;
  din=4'b1111; #10 ;
  din=4'b1010;
  #10 $stop;
  end
endmodule
