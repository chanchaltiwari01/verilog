
module up_down(clk,clr,din,load,up,count);
  input [3:0] din;
  input clk,clr,load,up;
  output reg [3:0] count ;
  
  always@(posedge clk)
   begin
     if (clr)
	 count <= 4'b0;
	 else if (load)
	  count <= din;
	  else if (up)
	  count <= count + 1'b1;
	 else 
	 count <= count - 1'b1;
   end 
endmodule 

module test_updonw;
  reg [3:0] din;
  reg clk=1'b0,clr,load,up;
  wire [3:0] count;
  
  up_down u0(clk,clr,din,load,up,count );
  
  always #5 clk = ~clk;
  initial begin
  din=4'b0111; clr=1; load=0; up=0; #10;
  clr=0; up=1; #50;
  up=0; #20;
  load=1; #10;
  load =0;
  end 
  initial begin
  $monitor("clk=%b,clr=%b, load=%b, up=%b, din=%b, count =%b", clk,clr,load,up,din,count);
   #300;
    $stop;
  end 
 endmodule 
