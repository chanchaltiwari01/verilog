module all_gate(y1,y2,y3,y4,y5,y6,y7,a,b);
  input a, b;
  output  y1,y2,y3,y4,y5,y6,y7;
  
  and(y1,a,b);
  or(y2,a,b);
  nand(y3,a,b);
  nor(y4,a,b);
  xnor(y5,a,b);
  xor(y6,a,b);
  not(y7,a);

endmodule

module test_all();
  reg a,b;
  wire  y1,y2,y3,y4,y5,y6,y7;
  
  all_gate tset_all(y1,y2,y3,y4,y5,y6,y7,a,b);
  
  initial
    begin
      #00 a=0; b=0;
      #10 a=0; b=1;
      #10 a=1; b=0;
      #10 a=1; b=1;
    end 
  
initial
  begin
    $dumpfile("dump.vcd"); $dumpvars;
    $monitor("[%0t] : a=%b, b=%b, and=%b, or=%b, nand=%b, nor=%b, xnor=%b, xor=%b, not=%b",$time,a,b,y1,y2,y3,y4,y5,y6,y7);
  end 
endmodule 
