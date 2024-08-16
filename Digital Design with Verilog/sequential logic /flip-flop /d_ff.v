  
 module d_flip_flop(
     input d,clk,reset,
	 output reg q,qb);
	 
	 always@ (posedge clk)
	  begin
	 if(reset) 
	 q <= 1'b0;
	 else
	  q <= d;
	  end 
	 always@(q) begin
	 qb <= ~q;
	 end 
endmodule 

module dff(
       input d,clk,reset,
	   output reg q,qb);
	   
	 always@(posedge clk, negedge reset)
	 begin
	 if(reset ==1'b0)
	   begin
	    q <= 1'b0; 
	    qb <= 1'b1;
	   end
	 else 
	  begin
	   q <= d; 
	   q <= ~q;
	  end 
	end
endmodule 	   


module test_dff;
  reg d,clk=1'b0,reset;
  wire q,qb;
  
  d_flip_flop u0(.d(d),.clk(clk),.reset(reset),.q(q),.qb(qb));
  
  always #5 clk = ~clk;
  initial begin 
    $monitor("clk=%B,reset=%b, d=%b, q=%b, qb=%B",clk,reset,d,q,qb);
   reset = 1'b1;  d=0; #10;
  reset = 1'b0; #10;
  d=1; #10;
  d=0; #10;
  $stop;
  end 
endmodule 
