
module mux_4x1(
  input a,b,c,d ,
  input [1:0] sel ,
  output reg out);

  always@*begin
    case(sel)
      2'b00 : out = a;
       2'b01 : out = b ;
       2'b10 : out = c ;
       2'b11 : out = d ;
      default : out = 1'b0;
    endcase
  end
endmodule 

module tb_mux ;
  reg a,b,c,d;
  reg [1:0] sel ;
  wire out ;

  mux_4x1 dut(.a(a),.b(b),.c(c),.d(d),.sel(sel),.out(out));

  initial begin
    sel =2'b00 ; a=1; b=0; c=0; d=0; #10;
    sel =2'b01 ; a=0; b=1; c=0; d=0; #10;
    sel =2'b10 ; a=0; b=0; c=1; d=0; #10;
    sel =2'b11 ; a=0; b=0; c=0; d=1; #10;
  end 

  initial begin
    $monitor("sel=%b,a=%0b,b=%0b,c=%0b,d=%0b,out=%0b",sel,a,b,c,d,out);
    $dumpfile("mux.vcd");
    $dumpvars(1);
  end 

endmodule 
