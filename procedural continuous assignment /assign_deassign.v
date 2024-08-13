/// assign and deassign /////
module dff(
  input din,rst,clk,
  output reg q);
  
  always@(posedge clk)begin
    q<=din;
  end
  
  always @(rst)begin
    if(rst) // asynchronous reset//
      assign q=1'b0;
    else 
      deassign q;
  end 
endmodule 

module test_dff;
  reg din ;
  reg clk ,rst ;
  wire q ;

  dff dut(.din(din),
          .clk(clk),
          .rst(rst),
          .q(q));
  //clock generation block
  always #5 clk = ~clk ;

  //initialise value 
  initial begin
    clk = 1'b0 ;
    rst = 1'b1 ;
    din = 1'b1;
    #10 rst = 1'b0;
  end 
  //input stimulus and monitoring block
  initial begin
    $monitor("[%0t]:rst=%0b,clk=%0b,din=%0b,out=%0b",$time,rst,clk,din,q);
    #16 rst = 1'b1;
    #10 rst = 1'b0; din=1'b1;
    #10 din=1'b0;
    #10 $finish;
  end 
endmodule 
  
