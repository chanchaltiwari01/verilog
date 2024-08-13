////////////////////// case statement //////////////////////
module multiplex4t1(a,b,c,d,sel,out);
input [1:0] a,b,c,d;
input [1:0] sel;
output reg [1:0] out;
always@(*)begin 
case(sel) 
2'b00 : out=a;
2'b01 : out=b;
2'b10 : out=c;
2'b11 : out=d;
default :out=2'bxx;
endcase 
end 
endmodule 

module test_mux;
reg [1:0]a,b,c,d,sel;
wire[1:0] out ;

multiplex4t1 u0(a,b,c,d,sel,out);
initial 
 begin 
 sel=2'b00;
   a=00;
   b=01;
   c=10;
   d=11;
#10 sel=2'b01;
#10 sel=2'b10;
#10 sel=2'b11;
#10 sel=2'b1x;
#10 sel=2'bzx;

end 
initial begin 
$monitor("a=%b, b=%b, c=%b, d=%b, sel=%b, out=%b",a,b,c,d,sel,out);
end
endmodule 


module mux2to1(input a,b,sel, output reg out);
always @*
begin 
case (sel)
1'b0: out =a;
1'b1: out =b;
default: out=1'bx;
endcase
end  
endmodule 

module test2to1mux;
reg a,b,sel;
wire out;

mux2to1 u0(a,b,sel,out);
initial 
begin 
sel=1'b0; a=0; b=1;
#10  sel=1'b1;
#10 sel=1'bx;
#10 sel=1'bz;
end 
initial begin
$monitor("a=%b, b=%b, sel=%b, out=%b", a,b, sel,out);
end 
endmodule 


//////////////////conditional operator ////////////////////////
module mux(input a,b,sel, output out);
assign out =sel ? b:a;
endmodule 

module testmux;
reg a,b,sel;
wire out;

mux u0(a,b,sel,out);
initial 
begin 
sel=1'b0; a=0; b=1;
#10  sel=1'b1;
#10 sel=1'bx;
#10 sel=1'bz;
end 
initial begin
$monitor("a=%b, b=%b, sel=%b, out=%b", a,b, sel,out);
end 
endmodule 

///////////////////////////////////////////////////////////////
module allmux(input[1:0] a,b,c,d,sel, output reg [1:0]out);
always@*
begin
 case(sel)
2'b00 : out =a;
2'b01 : out =b;
2'b10 : out =c;
2'b11 : out =d;
2'b0x,2'bx0,2'b1x,2'bx1,2'bzx,2'bxx,2'bzx : begin 
out=2'bxx; $display("sel contain x");
end 
2'b0z,2'bz0,2'b1z,2'bz1,2'bzz :  begin 
out=2'bzz;
$display("sel contain z");
end 
default : $display("unspecified inptu");
endcase 
end 
endmodule 


module test_muxall;
reg [1:0]a,b,c,d,sel;
wire[1:0] out ;

allmux u0(a,b,c,d,sel,out);
initial 
 begin 
 sel=2'b00;
a=00;
b=01;
c=10;
d=11;
#10 sel=2'b01;
#10 sel=2'b10;
#10 sel=2'b11;
#10 sel=2'b1x;
#10 sel=2'bzz;
end 
initial begin 
$monitor("a=%b, b=%b, c=%b, d=%b, sel=%b, out=%b",a,b,c,d,sel,out);
end
endmodule 

///////////////////////////casex and casez //////////////////////////////////
module casexz (
  input [1:0] a, b, c, d, sel,e,
  output reg [1:0] out1,out2);
  always @*
  begin
    casex (sel)
      2'b0? : out1 = a;
      2'b0x : out1 = b;
      2'b10 : out1 = c;
      2'b11 : out1 = d;
      default : out1 = e;
    endcase
  end

  always @*
  begin
    casez (sel)
      2'b1? : out2 = a;
      2'b0x : out2 = b;
      2'b10 : out2 = c;
      2'b11 : out2 = d;
      default : out2 = e;
    endcase
  end
endmodule

module testcasexz;
  reg [1:0] a, b, c, d, sel;
  reg [1:0] e;
  wire [1:0] out1,out2;

  casexz u0(a, b, c, d, e, sel, out1,out2);

  initial
  begin
    sel = 2'b00;
    a = 2'b00;
    b = 2'b01;
    c = 2'b10;
    d = 2'b11;
    e = 2'b00; // Assign a value to e
    #10 sel = 2'b01;
    #10 sel = 2'b10;
    #10 sel = 2'b11;
    #10 sel = 2'b1x;
    #10 sel = 2'bzz;
  end

  initial
  begin
    $monitor("a=%b, b=%b, c=%b, d=%b, sel=%b, out1=%b,out2=%b, e=%b", a, b, c, d, sel, out1,out2, e);
  end
endmodule
