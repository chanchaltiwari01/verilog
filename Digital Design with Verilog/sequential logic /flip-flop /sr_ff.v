
module sr_flip_flop(
   input s,r,clk,clr,
   output reg q,qb);
   
  always@(posedge clk, negedge clr)
   begin
   if (clr) begin
    q <= 1'b0;
	qb <= 1'b1;
	 end 
	else begin
	case ({s,r})
	2'b00 : q<=q;
	2'b01 : q<=1'b0;
	2'b10 : q<=1'b1;
	2'b11 : q<=1'bx;
	default : q<=1'bx;
    endcase
	end 
   end 
always @(q)
   begin
    qb <= ~q;
  end 
endmodule


module test_srff;
   reg clk=1'b0,clr,s,r;
  wire q,qb;
  
  sr_flip_flop u0(.clr(clr),.clk(clk),.s(s),.r(r),.q(q),.qb(qb));
   
  always #5 clk = ~clk;
  initial 
    begin 
      $monitor("clk=%b,clr=%b,s=%b,r=%b, q=%b,qb=%b",clk,clr,s,r,q,qb);
      clr=1; s=0; r=0; #10;
      clr=0; s=0; r=1; #10;
       s=1; r=0; #10;
       s=0; r=0; #10;
       s=1; r=1; #10;
      $stop;
    end 
endmodule 
