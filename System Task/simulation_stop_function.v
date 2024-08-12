module test;
reg clk=1'b0;

always #5 clk = ~clk;
initial begin
$monitor("time[%0t], clk=%0b",$time,clk);

#50 $stop; //$finish;
end 
  initial begin
    #20 $reset; ////reset is used reset simulation time;
  end
endmodule 
