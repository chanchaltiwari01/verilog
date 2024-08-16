module magnitude_comparater(a,b,lessthen ,equalto,greaterthen);
input [3:0]a,b;
output lessthen,equalto,greaterthen;
wire c,d;
not o0(c,a);
not o1(d,b);
assign lessthen=c&b;
assign equalto=a~^b;
assign greaterthen=a&d;
endmodule


module test_comparator;
reg a,b;
wire lessthen,equalto,greaterthen;

magnitude_comparater m1(a,b,lessthen ,equalto,greaterthen);

initial begin 
  a=0; b=0;
#1 a=0; b=1;
#1 a=1; b=0;
#1 a=1; b=1;
end 
initial begin
$monitor("a=%b,b=%b, lessthen=%b ,equalto=%b ,greaterthen=%b",a,b,lessthen,equalto,greaterthen);
end 
endmodule 

///////////////////////////4 bit magnitude comparator////////////////////////////////////////////////////////////////////////////
module magnitude_comparator4bit(a,b,less,equal,greater);
input [3:0] a,b;
output reg less,equal,greater;
always@(a,b)begin
{less,equal,greater}=3'b000;
if(a<b)
less = 1'b1;
else if(a==b)
equal=1'b1;
else 
greater=1'b1;
end 
endmodule  

module magnitude_comparator4bit_tb;
 reg [3:0] a, b;
 wire less, equal, greater;

   magnitude_comparator4bit uut(.a(a),.b(b),.less(less),.equal(equal),.greater(greater));

    initial begin
   
    // Test case 1: a < b
    a = 4'b0110;
    b = 4'b1011;
    #10;
    $display("Test 1: a=%b, b=%b, less=%b, equal=%b, greater=%b", a, b, less, equal, greater);

    // Test case 2: a == b
    a = 4'b1100;
    b = 4'b1100;
    #10;
    $display("Test 2: a=%b, b=%b, less=%b, equal=%b, greater=%b", a, b, less, equal, greater);

    // Test case 3: a > b
    a = 4'b1010;
    b = 4'b0111;
    #10;
    $display("Test 3: a=%b, b=%b, less=%b, equal=%b, greater=%b", a, b, less, equal, greater);
  end

endmodule
