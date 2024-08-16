module universal_shift(
      input [3:0] din,
	  input clk,clr,sel,load,sin,
	  output reg  [3:0] q);
	  
	always@(posedge clk)
	 begin
	   if(clr)
	   q <=4'b0000;
	   else if (load)
	   q <= din;
	   else if (sel)
	    q <= {q[2:0],sin};  //left shift
		else 
		 q <= {sin, q[3:1]};
	 end 
endmodule 

module test_universal_shift;
   reg [3:0] din;
    reg clk=1'b0,clr,load,sin,sel;
	wire [3:0] q;
	
	universal_shift u0(.sin(sin),.clk(clk),.clr(clr),.load(load),.sel(sel),.din(din),.q(q));
 always #5 clk = ~ clk ;
 initial begin 
    $dumpfile("dump.vcd");
        $dumpvars(1);
 $monitor("clr=%b,load=%b,clk=%b,sel=%b,sin=%b,din=%b,q=%b",clr,load,clk,sel,sin,din,q);
   clr=1; din=4'b1111; load=0; #10; sel=1;
   clr=0; sin=0; #10;
   load=1; #10;
   load=0; #40;
   sel=0;
   sin=1; #60;
   $stop;
 end 
 endmodule 
