  
 module jk_flip_flop(
     input clr,clk,j,k,
	 output reg q,qb);
	
	always@(posedge clk, negedge clr)
	 begin
	  if (clr==1'b1)
	   begin
	    q<=1'b0;
		qb=1'b1;
	   end 
	 else 
	    begin
		 case ({j,k})
		 2'b00 : q <= q;
		 2'b01 : q <= 1'b0;
		 2'b10 : q <= 1'b1;
		 2'b11 : q <= ~q;
		 default : q <=1'bx;
		 endcase
		end
	 end 
	always@(q)
	 begin 
	 qb <= ~q;
	 end 
endmodule 

module test_jkff;
  reg clk=1'b0,clr,j,k;
  wire q,qb;
  
  jk_flip_flop u0(.clk(clk),.clr(clr),.j(j),.k(k),.q(q),.qb(qb));
  
  always #5 clk = ~clk;
  initial 
    begin 
      $monitor("clk=%b,clr=%b,j=%B,k=%b,q=%b,qb=%b",clk,clr,j,k,q,qb);
      clr=1; j=0; k=0; #10;
      clr=0; #10
      j=0; k=1; #10;
      j=1; k=0;  #10;
      j=1; k=1; #10;
      $stop;
    end 
endmodule 
