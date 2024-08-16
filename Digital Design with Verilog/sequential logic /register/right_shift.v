
module right_shift (
     input sin,clk,clr,load,
	 input [3:0] din,
	 output reg [3:0] q);
	 
  always@(posedge clk)
    begin
	 if (clr)
	 q <= 4'b0000;
	 else if (load)
	  q <= din;
	  else 
	  q <= {sin,q[3:1]};
	end
endmodule 


module test_right_shift;
   reg [3:0] din;
    reg clk=1'b0,clr,load,sin;
	wire [3:0] q;
	
	right_shift u0(sin,clk,clr,load,din,q);
 always #5 clk = ~ clk ;
 initial begin 
    $dumpfile("dump.vcd");
        $dumpvars(1);
 $monitor("clr=%b,load=%b,clk=%b,sin=%b,din=%b,q=%b",clr,load,clk,sin,din,q);
   clr=1; din=4'b1111; load=0; #10;
   clr=0; sin=0; #10;
   load=1; #10;
   load=0; #40;
   sin=1; #50;
   $stop;
 end 
 endmodule 
