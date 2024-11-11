module mux_nx1 #(
  parameter N )(
  sel , in ,out );
  input [2**N : 0] in ;
  input [N-1:0] sel ;
  output out ;

  assign out = in[sel] ;

endmodule
