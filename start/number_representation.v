module numer_represent;
  reg [7:0] a,b,c,d,e,f;
  
  initial begin
    a=156;    // decimal represention  (unsized) 
    // default size is decimal
    b=8'haf;  // hexadecimal represention sized number
    c=4'o54; // ocatal
    d=5'b10011; // binary
    e=-4'd4 ; // negative number
    // 2's complement of 4 
    f=-3'b111 ;  // 2's complement of 7 
    $display("a=%b, b=%b, c=%b ,d=%b ,e=%b ,f=%b ", a,b,c,d,e,f);
  end 
  
endmodule 
