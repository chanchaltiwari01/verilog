module mux_16x1 #(parameter n = 4)(
  input [(2**n)-1:0] in,    
  input [n-1:0] sel,        
  output out);

  assign out = in[sel];     

endmodule


module tb_mux;
  parameter n = 4;     
  reg [(2**n)-1:0] in; 
  reg [n-1:0] sel;     
  wire out;

  
  mux_16x1 #(.n(n)) dut(.in(in), .sel(sel), .out(out));

  
  initial begin
    $monitor("sel=%0b, in=%0b, out=%0b", sel, in, out);
    $dumpfile("mux.vcd");
    $dumpvars(1);
  end

 
  initial begin
    in = 16'b0101_1010_1011_1101;  
    sel = 4'b1101;                 
    #10;
    sel = 4'b1001;                 
    #10;
    sel = 4'b1110;                 
    #10;
    $stop;  
  end
endmodule

    
