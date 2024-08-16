module sr_latch(
    input s,r,
	output reg q,q_bar);
	// output reg q=0,q_bar=1); for better result initialize the q ,q-bar
	always@(s,r)
	begin 
    if(!s && r)
	q <=1'b0;
	else if (s && !r)
	q <= 1'b1;
	else if (s && r) // s=1,r=1 truncate because it is  invaild 
	q <= q;
	end 
	always@(q)
	begin
	q_bar <= ~q;
	end 
endmodule 
	
	
module test_sr_latch;
  reg s,r;
  wire q,q_bar;
  
  sr_latch u0(.s(s),.r(r),.q(q),.q_bar(q_bar));
  initial begin
  $monitor("s=%b,r=%b,q=%b,q_bar=%b",s,r,q,q_bar);
  s=0; r=0; #1;
     s=1; r=0; #1
   s=0; r=1; #1;
    s=1; r=0; #1;
	 s=1; r=1; #1;
    s=0; r=0; #1;
    $stop;
	end 
endmodule 
