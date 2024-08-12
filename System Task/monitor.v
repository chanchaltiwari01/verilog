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
