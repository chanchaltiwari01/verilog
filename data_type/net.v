module nets_data_type ;
  wire a, b ;

  initial begin
    $display("a=%0b, b=%0b " ,a,b);
    #1 ;
    a=1'b0; b=1'b1;
    $display("a=%0b, b=%0b " ,a,b);
    #1;
    a=1'b1; b=1'b0;
    $display("a=%0b, b=%0b " ,a,b);
  end 
endmodule 
