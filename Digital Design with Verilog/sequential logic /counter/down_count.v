module down_counter(din,clk,clr,load,count);
input [3:0] din;
input clk,clr,load;
output reg [3:0] count ;

always @(posedge  clk)
 begin
  if(clr) 
    count <= 4'b1111;
  else if (load)
    count <= din;
  else 
   count <= count-1'b1;
end 
endmodule 


module test_down;
  reg [3:0] din;
  reg clk=1'b0,clr,load;
  wire [3:0] count ;
  
  
  down_counter u0(.din(din),.clk(clk),.clr(clr),.load(load),.count(count));
  
  always #5 clk = ~clk;
  initial
   begin
    $monitor("clk=%b, clr=%b, load=%b, din=%b, count=%b",clk,clr,load,din,count);
	clr=1; din=5; load=0; #10;
	clr=0; #30;
	load=1; #10;
	load =0; 
   end
  always @*
    begin
      if(count==4'b0)
	begin
	 #10 $stop;
	 #10;
	 end 
    end 
 endmodule 
 
