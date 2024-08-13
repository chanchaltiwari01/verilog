module gates (a,b,c,d);
  input a,b;
  output reg c,d;
  initial 
    begin 
      assign c=a&&b;
      assign d= a||b;
    end 
endmodule 


module gatestb();
  reg a=1,b=0;
  wire c,d;
  //a=1; reg can be initalized during the declaraton
  gates g1(a,b,c,d);
  initial begin 
    $monitor($time,"a=%b ,b=%b ,c=%b,d=%b",a,b,c,d);
    #1 a=0; b=0;
    #5 b=1;
    #5 a=1;
    #5 a=0;
    #5 b=0;
  end
endmodule 
/////////////////////////////////////////////////////////////////////////////////
