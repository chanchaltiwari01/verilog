////////////$test$plusargs ////////////////////////////////////////////
`timescale 1ns/1ns

module fifo;

  task write_task;
    begin
      $display("inside the write task");
    end
  endtask

  task read_task;
    begin
      $display("inside the read task");
    end
  endtask

  task write_read_task;
    begin
      $display("inside write read task");
    end
  endtask

  initial begin
    if ($test$plusargs("write"))
      write_task;
    else if ($test$plusargs("read"))
      read_task;
    else if ($test$plusargs("writeread1"))
      write_read_task;
    else 
      $display("no task is called");
  end
  
endmodule



/////run.do file ////////////////////////////
vlib work && vlog fifo.sv && vsim -c -do 
vsim +access+r +read
run -all; 
exit
  
//////////////////////////////////////////

module tb;
  initial begin
    if ($test$plusargs("STANDBY"))
      $display("STANDBY argument is found ...");
    if ($test$plusargs("Standby"))
      $display("Standby argument is also found ...");
    if ($test$plusargs("STAND"))
      $display("STAND substring is found ...");
    if ($test$plusargs("s"))
      $display("Some string starting with S found ...");
    if ($test$plusargs("T"))
      $display("Some string containing T found ...");
    if ($test$plusargs("STAND_AT_EASE"))
      $display("Can't stand any longer ...");
    if ($test$plusargs("SUNSHADE"))
      $display("It's too hot today ...");
    if ($test$plusargs("WINTER"))
      $display("No match.. ");
  end
endmodule
  
/////run.do file ////////////////////////////
vlib work && vlog tb.sv && vsim -c -do 
vsim +access+r +SUNSHADE 
run -all; 
exit
//////////////////////////////////////////

////////////////////$value$plusargs///////////////////////////////////////
module th;
  initial begin
    string varl, var;
    bit [31:0] data;

    if ($value$plusargs("STRING=%s", varl))
      $display("STRING with %%s has a value %s", varl);

    if ($value$plusargs("NUMBER=%0d", data))
      $display("NUMBER with %%0d has a value %0d", data);

    if ($value$plusargs("NUMBER=%0h", data))
      $display("NUMBER with %%0h has a value %0h", data);

    if ($value$plusargs("NUMBER=%s", data))
      $display("NUMBER with %%s has a value %0d", data);

    if ($value$plusargs("STRING=", varl))
      $display("STRING without FS has a value %s", varl);

    if ($value$plusargs("+STRING=Xs", varl))
      $display("STRING with + char has a value %s", varl);

    `ifdef RUNTIME_ERR
    if ($value$plusargs("STRING=%0d", var))
      $display("STRING with %%0d has a value %s", var);
    `endif
  end
endmodule

///////////////////////////////////////////////////////////////////
module test;
bit a;

task write ;
begin
if(a==1)
$display("task one is execute");
else if (a==0)
$display("task zero is execute ");
else
$display("no task will be called");
end
endtask 

initial begin
$value$plusargs("a_value =%0d",a);
end 
endmodule 
