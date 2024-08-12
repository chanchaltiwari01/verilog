`timescale 1ns/1ps

module time_function;

initial begin
  #10 $display("$time --display at [%0d]",$time);
  #15 $display("$stime ---display at [%0d]",$stime);
  #1.32 $display("$time ---display at [%0d]",$time); 
  $display("$realtime ---display at [%0f]",$realtime);
  #0.19 $display("$time ---display at [%0f]",$time);
  $display("$realtime ---display at [%0f]",$realtime);
  $printtimescale; //it is used to display the time unit and precision for a module 
end
endmodule
