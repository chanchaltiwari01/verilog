module or_gate (input a ,b,
                output c );
  assign c  = a | b ;
endmodule 

module tb; 
  reg a ,b ;
  wire c ;

  or_gate dut(.a(a),
              .b(b),
              .c(C) );
  initial begin
    for(int i=0 ; i<4 ; i=i+1) begin
      {a,b} = i ;
      #10 ;
    end 
    $stop ;
  end 
endmodule 
