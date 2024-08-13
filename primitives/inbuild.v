module primitive_eg(a,b,c,d,out);
  input a,b,c,d;
  output [6:0] out;
  and aw(out[0],a,b);
  or aq(out[1],b,c);
  xor ac(out[2],c,d);
  or a1(out[3],a,c,d);
  or a2(out[3],a,b,c);
  buf aa(out[4],out[5],a);
  bufif1 (out[6],a,d);
endmodule 

//// test banch /////

module primitivestb();
  reg a,b,c,d;
  wire [6:0] out ;
  
  primitive_eg ah(a,b,c,d,out);
  initial begin 
    #10 a=0; b=0; c=0; d=0;
    #12 a=0; b=0; c=0; d=1;
    #15 a=0; b=0; c=1; d=0;
    #17 a=0; b=0; c=1; d=1;
    #20 a=0; b=1; c=0; d=0;
    #22 a=0; b=1; c=0; d=1;
    #23 a=0; b=1; c=1; d=0;
    #25 a=0; b=1; c=1; d=1;
    #26 a=1; b=0; c=1; d=0;
    #27 a=1; b=0; c=1; d=1;
    #29 a=1; b=1; c=1; d=1;
  end 
  
  initial begin 
    $monitor($time,"out[0]=%b,out[1]=%b,out[2]=%b,out[3]=%b,out[4]=%b,out[5]=%b,out[6]=%b",out[0],out[1],out[2],out[3],out[4],out[5],out[6]);
    #300  $stop;
  end 
endmodule 

