module pal(a,b,c,x,y,z);
  input a,b,c;
  output  x,y,z;
  wire a_n,b_n,c_n;
  wire and_a,and_b,and_c,and_d,and_e,and_f,and_g,and_h,and_i;
  
  not u0(a_n,a);
  not u1(b_n,b);
  not u2(c_n,c);
  
   assign and_a = b ;
   assign and_b = 1'b0 ;
   assign and_c = 1'b0 ;
   assign and_d = a_n & b;
   assign and_e = a_n & c_n ;
   assign and_f = a & b_n & c;
   assign and_g = a & b ;
   assign and_h = a_n & b_n & c;
   assign and_i = 1'b0;
  
  assign x = and_a | and_b | and_c;
  assign y = and_d | and_e | and_f ;  
  assign z = and_g | and_h | and_i;
    
endmodule 

module pal_tb;
  reg a, b, c;
  wire x,y,z;

  // Instantiate the pla module
  pal uut ( .a(a), .b(b), .c(c), .x(x), .y(y), .z(z) );

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
    $monitor("At time %0t: a = %b, b = %b, c = %b, x = %b, y = %b , z = %b", $time, a, b, c, x, y,z);
    $dumpfile("dump.vcd");
    $dumpvars(1);
  end
endmodule

////////////////////////////////////////////////////////////////////////////////
module pal1(a,b,c,x,y);
  input a,b,c;
  output  x,y;
  wire a_n,b_n,c_n;
  wire and_a,and_b,and_c,and_d,and_e,and_f;
  
  not u0(a_n,a);
  not u1(b_n,b);
  not u2(c_n,c);
  
   assign and_a = b_n & c_n ;
   assign and_b = b & c ;
   assign and_c = 1'b0 ;
   assign and_d = b_n & c ;
   assign and_e = a & c ;
   assign and_f = a_n & b & c_n ;
  
  assign x = and_a | and_b | and_c;
  assign y = and_d | and_e | and_f ; 
    
endmodule 

module pal_tb;
  reg a, b, c;
  wire x,y;

  // Instantiate the pla module
  pal1 uut ( .a(a), .b(b), .c(c), .x(x), .y(y) );

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
    $monitor("At time %0t: a = %b, b = %b, c = %b, x = %b, y = %b", $time, a, b, c, x, y);
    $dumpfile("dump.vcd");
    $dumpvars(1);
  end
endmodule
