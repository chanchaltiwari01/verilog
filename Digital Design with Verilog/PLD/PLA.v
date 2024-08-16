module pla(a,b,c,f1,f2);
  input a,b,c;
  output  f1,f2;
  wire a_n,b_n,c_n;
  wire and_a,and_b,and_c,and_d,and_e;
  
  not u0(a_n,a);
  not u1(b_n,b);
  not u2(c_n,c);
  
   assign and_a = b_n & c_n ;
   assign and_b = b & c ;
   assign and_c = a & c ;
   assign and_d = b_n & c ;
   assign and_e = a_n & b & c_n ;
  
  assign f1 = and_a | and_b ;
  assign f2 = and_c | and_d | and_e ;
  
endmodule   

module pla_tb;
  reg a, b, c;
  wire f1, f2;

  // Instantiate the pla module
  pla uut( .a(a), .b(b), .c(c), .f1(f1), .f2(f2) );

  // Test procedure
  initial begin
    // Initialize inputs
    a = 0; b = 0; c = 0; #10;     
    a = 0; b = 0; c = 1; #10;   
    a = 0; b = 1; c = 0; #10;    
    a = 0; b = 1; c = 1; #10;    
    a = 1; b = 0; c = 0; #10;    
    a = 1; b = 0; c = 1; #10;    
    a = 1; b = 1; c = 0; #10;    
    a = 1; b = 1; c = 1; #10;    
    $stop;
  end
  
  // Monitor the changes
  initial begin
    $monitor("At time %t, a = %b, b = %b, c = %b, f1 = %b, f2 = %b", $time, a, b, c, f1, f2);
    $dumpfile("dump.vcd");
    $dumpvars(1);
  end

endmodule

////////////////////////////////////////////////////////////////////////////////////////////////////////
module pla1(a,b,c,f1,f2);
  input a,b,c;
  output  f1,f2;
 wire a_n,b_n,c_n;
  wire and_a,and_b,and_c,and_d,and_e;
  
  not u0(a_n,a);
  not u1(b_n,b);
  not u2(c_n,c);
  
   assign and_a = b_n & c_n ;
   assign and_b = b & c ;
   assign and_c = a & c ;
   assign and_d = b_n & c ;
   assign and_e = a_n & b & c_n ;
  
  assign f1 = and_a | and_b ;
  assign f2 = and_c | and_d | and_e ;
  
endmodule  

module pla_tb1;
  reg a, b, c;
  wire f1, f2;

  // Instantiate the pla module
  pla1 uut ( .a(a), .b(b), .c(c), .f1(f1), .f2(f2) );

  // Test procedure
  initial begin
    // Initialize inputs
    a = 0; b = 0; c = 0; #10;     
    a = 0; b = 0; c = 1; #10;   
    a = 0; b = 1; c = 0; #10;    
    a = 0; b = 1; c = 1; #10;    
    a = 1; b = 0; c = 0; #10;    
    a = 1; b = 0; c = 1; #10;    
    a = 1; b = 1; c = 0; #10;    
    a = 1; b = 1; c = 1; #10;    
    $stop;
  end
  
  // Monitor the changes
  initial begin
    $monitor("At time %t, a = %b, b = %b, c = %b, f1 = %b, f2 = %b", $time, a, b, c, f1, f2);
    $dumpfile("dump.vcd");
    $dumpvars(1);
  end

endmodule
