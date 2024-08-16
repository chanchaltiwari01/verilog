module half_sub(a,b,dif,bo);
  input a,b;
  output reg dif,bo;

  // xor x0(dif,a,b);
  // and a0(bo,~a,b);
  
  always @*begin
    dif = a ^ b;
    bo = ~a & b;
  end
endmodule

module test_sub;
  reg a,b;
  wire dif, bo;
  
  half_sub u0(a,b,dif,bo);
  initial begin
    integer i;
    for(i=0;i<=3;i=i+1)
      begin
        {a,b}=i;
        #10;
      end
  end
    initial begin
      $monitor("a=%b,b=%b,dif=%b,bo=%b",a,b,dif,bo);
    end 
endmodule 
