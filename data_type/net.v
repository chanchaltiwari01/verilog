module nets_data_type ;
  wire a, b ;
  reg [1:0] c ;
  
  initial begin
    #10 c = 2'b01;
    #10 c = 2'b10;
  end 
  
  assign {a,b} = c ;
    

  always@* begin
    $display("a=%0b, b=%0b",a,b);
  end 
  
endmodule 
