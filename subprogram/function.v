module function_sum(a,b,out);
input[7:0] a,b;
output [7:0] out;
function[7:0] sum([7:0]a,b);
begin
sum=a+b;
end 
endfunction 
assign out=sum(a,b);
endmodule 

module function_sum_tb;

  reg [7:0] a, b;
  wire [7:0] out;

 function [7:0] sum;
    input [7:0] a, b;
    begin
      sum = a + b;
    end 
  endfunction 

  function_sum dut (.a(a),.b(b),.out(out));

  initial begin
    $display("Testing function_sum module");
     
    a=7; b = 10;
    #10;
  $display("Input values: a=%d, b=%d", a, b);
    $display("Expected sum: %d", sum(a, b));
    $display("Actual sum: %d", out);
    if (out == sum(a, b))
      $display("Test passed");
    else
      $display("Test failed");
  
  end

endmodule

////// /////function for prity generator with out using reduction generator///////
module parity_cal(din,dout);
input [7:0] din;
output reg dout ;
function parity (input [7:0] din);
integer i;
reg temp;
begin
temp=0;
for(i=0;i<=7;i=i+1)
temp=temp^din[i];
parity=temp;
end 
endfunction 
always@*
 begin 
dout = parity(din);
end 
endmodule 

module parity_cheek;
  reg [7:0] din;
  wire dout;
function parity (input [7:0] din);
integer i;
reg temp;
begin
temp=0;
for(i=0;i<=7;i=i+1)
temp=temp^din[i];
parity=temp;
end 
endfunction 
  parity_cal u0 (.din(din), .dout(dout));

  initial begin 
#10 din = 8'b10101011;
    $display("input number : din=%b", din);
    $display("'parity of number: dout=%b", dout);
  end 
endmodule

module parity_cala(input [7:0] din, output reg dout);
  function parity(input [7:0] din);
    integer i;
    reg temp;
    begin
      temp = 0;
      for (i = 0; i <= 7; i = i + 1)
        temp = temp ^ din[i];
      parity = temp;
    end
  endfunction
  
  always@*
begin
    dout = parity(din);
  end
endmodule

module parity_check;
  reg [7:0] din;
  wire dout;

  parity_cala u0 (.din(din), .dout(dout));

  initial begin 
    $display("Simulating parity_cal module");

    din = 8'b10101011;
    #10;
    $display("Input number: din=%b", din);
    $display("Parity of number: dout=%b", dout);

    din = 8'b11111111;
    #10;
    $display("Input number: din=%b", din);
    $display("Parity of number: dout=%b", dout);
    
    #10 $stop;
  end 
endmodule
///////////////////////////////automatic function ////////////////////////////////////////////////////////
module function_auto(din, dout);
input [7:0] din;
output reg [61:0] dout;
function automatic [63:0] fact(input [7:0] din);
begin 
if (din<=1)
fact=1;
else
 fact=fact(din-1)*din;
end 
endfunction
always@*
dout=fact(din);
endmodule 



module test_fact;
reg [7:0] din;
wire [61:0] dout ;
  
function_auto u0(din, dout);
  
initial begin 
$monitor("input of numer :din=%d , fact of number : dout=%d", din ,dout );
din= 8'b00000101;
#10 din= 8'b00000100;
end
endmodule 


