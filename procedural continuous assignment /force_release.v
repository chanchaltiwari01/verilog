module dfff(din ,clk, q);
  input din,clk;
  output reg q;
  always@(posedge clk)begin
    q<=din;
  end 
endmodule

module testdff;
  reg din, clk;
  wire q;
  dfff u0(din,clk,q);
  always #5 clk = ~ clk ;
  initial begin 
    clk=1'b0;
    force u0.q=0;
    #10 release u0.q;
    forever #10 din=$random;
  end 
  initial begin 
    $monitor("[%0t]: clk=%0b,din=%0b,q=%0b",$time,clk,din,q);
    #50; $stop;
  end 
 endmodule 
