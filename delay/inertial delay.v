/* inertial delay  - output will be not change becuase of change of value time is less then delay time */
///////behavioral modueling delay ///
////regular delay in  behavioral//
module delay (input signed [31:0] a, output integer  b);

  always @(a)begin
  #3 b=a;
  //#3 b<=a;
  end
endmodule

module testdelay ;
reg signed [31:0] a;
wire  b;

  delay u0( .a(a),.b(b));
  initial begin
  $monitor("value off a=%d, b=%d", $time ,a,b);
  a=3;
  #10;
  a=5;
  end 
endmodule 
