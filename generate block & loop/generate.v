module ha1(input a, b, output sum, cout);
  assign sum = a ^ b;
assign cout =a&b;
endmodule

module my_design( a,b,sum,cout);
 parameter n=8;
 input [n-1:0] a, b;
  output [n-1:0] sum,cout;
  genvar i;
  generate
    for (i=0; i<n; i=i+1) begin 
      ha1 u0(.a(a[i]), .b(b[i]), .sum(sum[i]), .cout(cout[i]));
    end
  endgenerate
endmodule

module testbenchgen;
parameter n=8;
  reg [n-1:0] a, b;
  wire [n-1:0] sum,cout;

  my_design dut(.a(a), .b(b), .sum(sum), .cout(cout));

  initial begin
//$display("a=%b, b=%b, Sum = %b, Cout = %b",a, b,  sum, cout);
 $monitor("a=%b, b=%b, sum=%b, cout=%b", a, b, sum,cout);
    a = 8'b10100110;
    b = 8'b01101001; 
    #10 ;
    a=8'b10110110;
    b=8'b11101001; 
    #10;
    a=8'b11111111;
    b=8'b11111111;
    // Add more test cases here
    #10 $stop;
  end
endmodule


module ha (input a,b,output sum,cout);
  assign sum = a ^ b;
  assign cout = a&b;
endmodule

module my_pdesign (input [3:0] a,b,output [3:0] sum, cout);
  genvar i;
  generate
    for (i = 0; i < 4; i = i + 1)
 begin
      ha u0 (.a(a[i]),.b(b[i]),.sum(sum[i]),.cout(cout[i]));
    end
  endgenerate
endmodule

module testgenloop;
  reg [3:0] a,b;
  wire [3:0] sum,cout;
  
  my_pdesign dut(.a(a),.b(b),.sum(sum),.cout(cout));

  initial begin
    $monitor("a=%b, b=%b, sum=%b, cout=%b", a, b, sum,cout);
    
    // Test case 1
    #10;
    a = 4'b1101;
    b = 4'b1010;
    
    // Test case 2
    #10;
    a = 4'b0101;
    b = 4'b0110;
    // testcase 3
#10 a=4'b1111;
    b=4'b1010;
    // Add more test cases here if needed

    #10;
    $stop;
  end

endmodule


////////////////generate for conditional(if esle) statement ///////////
module logic_univ(output [3:0] op, input [3:0] in1, in2);
  parameter logic_type = "andgae";
   generate
    if (logic_type == "orgate") 
      assign op = in1 | in2;
    else if (logic_type == "andgate") 
      assign op = in1 & in2;
    else 
    assign op=in1^in2;
  endgenerate
endmodule

module testgencase;
  reg [3:0] in1, in2;
  wire [3:0] op;
  parameter logic_type = "andgate";
  
  logic_univ u0 (.op(op), .in1(in1), .in2(in2));

  initial begin
    $monitor("in1=%b, in2=%b, op=%b", in1, in2, op);
    
    #10 in1 = 4'b1111; in2 = 4'b1010;
    #10 in1 = 4'b1111; in2 = 4'b1111;
    #10 in1 = 4'b1111; in2 = 4'b1000;
    #10 in1 = 4'b1010; in2 = 4'b0101;
    
    #10 $stop;
  end 
endmodule


//////////// generate statement for case statements //////

module generate_case(a,b,y);
parameter n=2;
input a,b;
output y;
generate 
case(n)
1: and (y,a,b);
2: nand (y,a,b);
3: or (y,a,b);
4: nor(y,a,b);
5: xor(y,a,b);
6: xnor(y,a,b);
endcase 
endgenerate
endmodule 

module testcase ;
reg a,b;
wire y;
defparam m0.n=3;

generate_case u1(a,b,y);
initial 
begin
$monitor("a=%b, b=%b, y=%b", a,b ,y);
a=0; b=0;
#1 a=0; b=1;
#1 a=1; b=0;
#1 a=1; b=1;
end 
endmodule 

