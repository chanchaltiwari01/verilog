module half_adder(a,b,sum,cout);
  input a,b;
  output reg  sum,cout;
  
  xor x1(sum,a,b);
  and a1(cout,a,b);
  
//   always @*begin 
//     sum = a^b;
//     cout = a&b;
//   end 
endmodule 

module test_half;
  reg a,b ;
  wire sum, cout ;
  integer i;
  
  half_adder u0(a,b,sum,cout );
  
  initial begin 
    for(i=0;i<=3;i=i+1) begin
        {a,b}=i;
      #10;
    end 
  end
    initial begin
      $monitor("a=%b,b=%b,sum=%b,cout=%b",a,b,sum,cout);
    end 
endmodule 
