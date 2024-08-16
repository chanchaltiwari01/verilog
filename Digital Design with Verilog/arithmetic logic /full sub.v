module full_sub(a,b,bin,dif,bout);
input a,b,bin;
output reg dif,bout ;
wire x,y,z ;
  wire n,n0;

  xor x0(x,a,b);
  xor x1(dif,x,bin);
  not n1(n,a);
  not n2(n0,x);
  and a0(y,n,b);
  and a1(z,n0,bin);
  or o0(bout,y,z);
  
// always @*
//   begin
//   dif = a^b^bin;
//     bout = ((~a ) & b) | ((~(a^b) & bin));
//   end 
endmodule 


module test_full_sub;
  reg a,b,bin;
  wire dif,bout;
  
full_sub u0(a,b,bin,dif,bout);
initial begin
integer i;
for(i=0;i<=7;i=i+1)
begin
  {a,b,bin}=i;
#10;
end 
end
initial begin
  $monitor("a=%b, b=%b, bin=%b, dif=%b, bout=%b",a,b,bin,dif,bout);
end
endmodule 
