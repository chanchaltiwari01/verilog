//$monitor continuously   monitors list of variables and 
//executes whenever any of the arguments changes it value.
//$monitor automatically adds a new line like $display
// only one monitor can be active at a time 

module monitor;
  reg a, b;
  wire c;

  // Function to compute OR gate
  function int or_gate(input a, input b);
    return a | b;
  endfunction 

  // Assign output c using the function
  assign c = or_gate(a, b);

  // Generate test vectors
  initial begin
    #1 a = 0; b = 0;
    #1 a = 0; b = 1;
    #1 a = 1; b = 0;
    #1 a = 1; b = 1;
  end 

  // Monitor the output
  initial begin
    $monitor("monitor output");#1;
    $monitoroff;
    $monitor("stime=%0t | a=%0b | b=%0b | c=%0b", $stime, a, b, c);
    #5 $finish; // End the simulation after some time
  end 
endmodule

///////////////////////////////////////////////////////////////////////////////////////////
module monitor();
integer a=0,count=1'b0;
initial 
begin 
  #1 $monitor("a=%0d",a);
// multiple monitor can over write the result #10 a=10 ;
#10 a=15;
// if u want to use multiple monitor in single program so   u can control by $monitoron and $monitoroff S
a=5;

a=8 ; 
#10 $monitoroff;
  #1 $monitor("value of counte is %0d", count);
#1 $monitoroff;
  #1 $monitor("jay shree ram"); 
#1 $monitoroff;  
  #1 $monitor("time=%0t",$time);
#1 $monitoroff;
  #1 $monitor("a,b,c");
#1 $monitoroff;
end 
endmodule
