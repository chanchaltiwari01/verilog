module not_gate(
  input a ,
  output y );

  not n0(y,a);
  //assign y = ~a ;
endmodule 


module tb ;
  reg a ;
  wire y ;

  not_gate dut(.a(a),
               .y(y));
  initial begin
    a = 1'b1;
    #10 1'b0 ;
    #10 $stop ;
  end

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    $monitor("[%0t] , a=%0d , y=%0d ",$time,a,y);
  end 
endmodule 
