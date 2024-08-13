module d_latch(d,en,q,qb);
  input d , en ;
  output reg q ;
  output qb ;

  always@(en,d)begin
    if(en)
      q <= d ;
    else
      q <= q ;
  end 
  assign qb = ~q ;

endmodule 

module top_d_latch ;
  reg  d, en ;
  wire q ,qb ;

  d_latch dut(.d(d),.en(en),.q(q),.qb(qb));
  
  initial begin
    en=0; d=1 ;
    #10 en = 1 ;
    #10 d=0; 
    #10 d=1;
    #10 en=0;
  end 

  initial begin
    $monitor("en=%0b,d=%0b,q=%0b,qb=%0b",en,d,q,qb);
  end 
endmodule 
