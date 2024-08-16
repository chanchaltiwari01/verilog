/////////////////////decoder circuit ///////////////////////////////////////
module decoder3to8(in ,out);
  input [2:0] in ;
  output reg [7:0] out ;
  
  always@* begin
    case(in) 
      3'b000 : out = 8'b0000_0001 ;
      3'b001 : out = 8'b0000_0010 ;
      3'b010 : out = 8'b0000_0100 ;
      3'b011 : out = 8'b0000_1000 ;
      3'b100 : out = 8'b0001_0000 ;
      3'b101 : out = 8'b0010_0000 ;
      3'b110 : out = 8'b0100_0000 ;
      3'b111 : out = 8'b1000_0000 ;
      default : out = 8'b0;
    endcase
  end 
endmodule

//////////////////////////////////////////////////////////////////
module PROM(a,b,c,d);
  input a,b,c;
  output [5:0] d;
  wire [7:0] w;
  
  decoder3to8 u0(.in({a,b,c}),.out(w));
  assign d[0] = c;
  assign d[1] = 1'b0;
  assign d[2] = w[1] | w[6] ;
  assign d[3] = w[3] | w[5] ;
  assign d[4] = w[4] | w[5] | w[7] ;
  assign d[5] = w[6] | w[7] ;
  
endmodule

module ROM_tb;
  reg a, b, c;
  wire [5:0] d;
 wire [7:0] w;

  // Instantiate the pla module
  PROM uut( .a(a), .b(b), .c(c), .d(d) );

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
    $monitor("At time %0t: a = %b, b = %b, c = %b, d = %b", $time, a, b, c, d);
    $dumpfile("dump.vcd");
    $dumpvars(1);
  end
endmodule 

module top_module;
  wire a, b, c;
  wire [5:0] d;
  wire [7:0] w;
  
// Instantiate the decoder module
  decoder3to8 decoder_instance(.in({a,b,c}), 
                               .out(w));
  // Instantiate the PROM module
  PROM prom_instance(
    .a(a),
    .b(b),
    .c(c),
    .d(d)
  );

  // Instantiate the ROM_tb module
  ROM_tb tb_instance(
    .a(a),
    .b(b),
    .c(c),
    .d(d)  );

endmodule
////////////////////////////////////////////////////////////////////////////////////////////////////////////
module decoder3to8(in, out);
  input [2:0] in;
  output reg [7:0] out;

  always @* begin
    case (in)
      3'b000: out = 8'b0000_0001;
      3'b001: out = 8'b0000_0010;
      3'b010: out = 8'b0000_0100;
      3'b011: out = 8'b0000_1000;
      3'b100: out = 8'b0001_0000;
      3'b101: out = 8'b0010_0000;
      3'b110: out = 8'b0100_0000;
      3'b111: out = 8'b1000_0000;
      default: out = 8'b0;
    endcase
  end
endmodule

module PROM(a, b, c, d);
  input a, b, c;
  output [5:0] d;
  wire [7:0] w;

  decoder3to8 u0 (.in({a, b, c}), .out(w));

  assign d[0] = c;
  assign d[1] = 1'b0;
  assign d[2] = w[1] | w[6];
  assign d[3] = w[3] | w[5];
  assign d[4] = w[4] | w[5] | w[7];
  assign d[5] = w[6] | w[7];
endmodule

module ROM_tb(a, b, c, d);
  output reg a, b, c;
  input [5:0] d;

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
    $monitor("At time %0t: a = %b, b = %b, c = %b, d = %b", $time, a, b, c, d);
    $dumpfile("dump.vcd");
    $dumpvars(1);
  end
endmodule
  
  
