module mux_2x1(input in0,in1,sel,output out);
//reg out ; // user in procedural assignmenet 
  
  assign out = sel ? in0 : in1 ;
  
  // assign out = (~sel & in0 ) | (sel & in1) ;

  /* wire a ,b ,c;
  not n0(c,sel);
  and a0(a,c,in0);
  and a1(b,sel,in1);
  or o0(out,a,b); */
  
  
/*
  always@* begin
   if(sel)
   out = in1;
   else
   out = in0 ;
   end
  */
  
/* always@* begin
case(sel)
1'b0 : out = in0;
1'b1 : out = in1 ;
default : out = in0;
endcase
end 
*/
  
endmodule 

module test_mux ;
  reg in0,in1,sel;
  wire out ;

  mux_2x1 dut(.in1(in1),.in0(in0),.sel(sel),.out(out));

  initial begin
    sel =0 ; in1 =1 ; in0=0; #10 ;
    sel =1 ; in1 =0 ; in0=1; #10 ;
    sel =1 ; in1 =0 ; in0=1; #10 ;
    sel =0 ; in1 =1 ; in0=0; #10 ;
  end 

  initial begin
    $dumpfile("mux.vcd");
    $dumpvars(1);
    $monitor("sel=%0b,in0=%0b,in1=%0b,out=%0b",sel,in0,in1,out);
  end 
endmodule 

    
