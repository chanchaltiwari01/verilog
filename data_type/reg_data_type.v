module reg_data_type;
  //default value is X 
  reg a , b ;    //scalar
  reg [3:0] c ; //vector reg
  integer i ;
  time t ;
  real d , e;
  
  initial begin
    $monitor("a=%0d,b=%0d,c=%0d,d=%0d,e=%0d,t=%0d",a,b,c,d,e,t);
  end 
  
  initial begin
    #10 ;
    a = 1'b0 ; b = 1'b0; 
    c = 2'b10; i = 15 ;
    t = $time ;
    d = 3.14 ; e = 5e2; 
  end 
endmodule 
