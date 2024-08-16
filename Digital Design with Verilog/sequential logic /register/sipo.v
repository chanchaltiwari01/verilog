// Serial-In Parallel-Out (SIPO) shift register
  
 module sipo(
    input din,clk,clr,
	output reg [3:0] q);
	
	always@(posedge clk)
	 begin
       if(clr)
	   q <= 4'b0000;
	  else
	   begin
	        q[3] <= din;
		q[2] <= q[3];
		q[1] <= q[2];
		q[0] <= q[1];
		end 
     end
endmodule 


module test_sipo;
 reg din,clk=1'b0,clr;
 wire [3:0] q;
 
 sipo u0(.din(din),.clk(clk),.clr(clr),.q(q));
 
 always #5 clk =~clk;
  initial 
   begin
    $monitor("clk=%b, clr=%b, din=%b, q=%b",clk,clr,din,q);
	 $dumpfile("dump.vcd");
        $dumpvars(1);
		
	clr=1; din=1; #10;
	clr=0; #10 ;
	din=1; #10;  
	din=0; #10;
	din=1; #10; 
	#40; 
     $stop;
	 end
endmodule 
