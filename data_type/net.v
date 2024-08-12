module nets_data_type ;
  wire a, b ;
  
  assign  #1 {a,b} = 2'b01 ; 
  assign  #2 {a,b} = 2'b10 ; 
  assign  #3 {a,b} = 2'b01 ; 

  initial begin
    $display("a=%0b, b=%0b",a,b);
  end 
  
endmodule 
