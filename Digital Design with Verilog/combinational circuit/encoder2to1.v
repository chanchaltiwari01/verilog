module encoder2_to_1(
   input a, b,
   output reg out
);

always @* begin
    if ({a, b} == 2'b01)
        out = 1'b0;
    else if ({a, b} == 2'b10)
        out = 1'b1;
    else
        out = 1'b0;
end

endmodule
//2_to_1 encoder using case statement 

module encoder2to1(
  input [1:0] data ,
  output reg out );
  
  always@*
    begin
      case(data)
        2'b01: out =1'b0;
        2'b10: out =1'b1;
        default: out =1'b0;
      endcase
    end 
endmodule 




module test_encoder;
  reg [1:0] data;
  wire out;

  encoder2to1 u0(data, out);

  initial begin
    $monitor("data=%b, out=%b",data, out);
      data=2'b10; #10;
      data=2'b01; #10;
     data=2'b11; #10;
     data=2'b00; #10;
    $finish;
  end
endmodule
