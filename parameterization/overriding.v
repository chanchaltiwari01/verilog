module mux #(parameter width = 2 , depth = 4 )(in , sel , out );
  input [width-1:0] sel ;
  input [depth-1:0] in ;
  output out ;
  
  assign out = in[sel] ;
  
  initial begin
    $display("[inside dut] :width=%0d , depth=%0d",width,depth);
  end
  
endmodule 

module test ;
  reg[dut.width-1:0] sel ;
  reg[dut.depth-1:0] in ;
  wire out ;
  
//   mux #(4,16) dut(.in(in),.sel(sel),.out(out));
  mux  dut(.in(in),.sel(sel),.out(out));
  
  initial begin
    $display("[inside test] :width=%0d , depth=%0d",dut.width,dut.depth);
    in = $random ;
    sel = $random ;
    #1;
    $display("in=%0b, sel=%0b,out=%0b",in,sel,out);
  end 
endmodule 
