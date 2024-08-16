module t_flip_flop(
      input t,clk,clr,
	  output reg q,qb);
	
 always @(posedge clk)  
  begin
    if(clr==1'b1)
  begin
  q <= 1'b0; 
  qb <= 1'b1;
   end
 else 
    begin 
 if ( t==1'b0)
  begin
   q <= q;
   qb <= qb;
   end 
  else 
   begin
   q <= qb;
   qb <= q;
   end
    end
  end
 endmodule 

module test_t_ff;
  reg t, clk = 0, clr = 0;
  wire q, qb;

  t_flip_flop u0(
    .t(t),
    .clk(clk),
    .clr(clr),
    .q(q),
    .qb(qb)
  );

  always #5 clk = ~clk;

  initial begin
    $monitor("t=%b, clk=%b, clr=%b, q=%b, qb=%b", t, clk, clr, q, qb);
    
    clr = 1;
    t = 0; #10;
    t = 1; #10;
    
    clr=0;
    t = 0; #10;
    t = 1; #10;

    t = 0; #10;
    t = 1; #10;

    
    t = 0; #10;
    t = 1; #10;
    
    clr=1;
    t = 0; #10;
    t = 1; #10;
    
  
    $stop;
  end

endmodule
