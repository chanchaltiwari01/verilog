
module up_couneter (clk,rst,din,load,count );
input [3:0] din;
input clk,rst,load;
output reg [3:0] count ;

always@ (posedge clk)
  begin
    if(rst)
	count <= 4'b0;
	else if (load)
	 count <= din;
	  else 
	  count <= count + 1'b1;
  end 
endmodule 


module test_up;
 reg [3:0] din;
 reg clk=1'b0,rst,load;
 wire [3:0] count ;

up_couneter u0(.clk(clk),.rst(rst),.din(din),.load(load),.count(count));
 
always #5 clk = ~clk;
initial begin 
$monitor("clk=%b, rst=%b, load=%b, din=%b , count=[%d] [%b] ", clk,rst,load,din,count,count);
din=0; rst=1; load=0; #10;
rst=0; din=1; load=1; #10;
load = 0; #10;
end 
always@* 
begin
  if(count== 4'b1111) begin
  #10;
$stop;
#10;
  end 
end 
endmodule 
