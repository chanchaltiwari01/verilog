module BCD_to_Excess3(a,b,c,d,w,x,y,z);
  input a,b,c,d;
  output w,x,y,z; 
  
  assign w = a | (b & c) | ( b & d) ;
  assign x = ((~b & c) | (~b & d) | (b & ~c & ~d));
  assign y = ((c & d) | (~c & ~d));  
  assign z = (~d ) ; 
  
endmodule
/////////////////////////////////////////////////////////////////////////
/*
module bcd_to_excess3(bcd,exce);
input [3:0] bcd;
output reg [3:0] exce ;

always@*begin
exce = bcd + 2'b11;
end
endmodule 
*/

module tb_bcd_excess3;
  reg a, b, c, d;
  wire z, w, x, y;

  BCD_to_Excess3 dut(.a(a), .b(b), .c(c), .d(d), .z(z), .w(w), .x(x), .y(y));

  initial begin 
    $monitor("[%0t]: binary=%b, Excess-3=%b", $time, {a, b, c, d}, {w, x, y, z});
    $dumpfile("bcd_exce2.vcd");
    $dumpvars(1);
  end 

  initial begin
    {a, b, c, d} = 4'b0110; #10;
    {a, b, c, d} = 4'b0100; #10;
    {a, b, c, d} = 4'b0111; #10;
    {a, b, c, d} = 4'b1010; #10;
    {a, b, c, d} = 4'b1110; #10;
    $stop;
  end 
endmodule

