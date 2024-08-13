module and_gate(a,b,y);
  input a , b ;
  output y ;

  assign y = a & b ;

endmodule

module test_and ;
  reg a,b;
  wire y;

  and_gate dut(.a(a),.b(b),.y(y));

  initial begin
    for(integer i=0 ; i<4 ;i=i+1)begin
      {a,b} = i ;
      #5;
    end 
  end
  initial begin
    $monitor("[%0t]: a=%0b, b=%0b, y=%0b",$time,a,b,y);
    $dumpfile("and_gate.vcd");
    $dumpvars(1);
  end 
  
endmodule 
