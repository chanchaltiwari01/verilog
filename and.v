module and_gate (c,a,b);
input a,b;
output c;
and a1(c,a,b);
  //assign c = a & b ;
  /* always@* begin
  c = a & b ;
  end */
endmodule

module tb ;
  reg a , b ;
  wire c ;

  and_gate dut(.a(a),
               .b(b),
               .c(c));
  initial begin 
    $monitor("[%0t] : a=%0d , b=%0d , c=%0d",$time,a,b,c);
    for(integer i = 0 ; i<4; i=i+1)begin
      {a,b} = i ;
      #10 end 
    $stop;
  end 
endmodule 
