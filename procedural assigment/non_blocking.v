module nonblockingtest;
reg [1:0] a=2'b01 , b=2'b10 , c=2'b11;
initial 
begin 
$monitor("monitor\n,a=%b,b=%b,c=%b",a,b,c);
a<=2'b00; 
b<=a;
c<=b;
$display("display\n,a=%b,b=%b,c=%b",a,b,c);
end 
endmodule



module nonblocktest2;
reg [2:0] a=3 , b=1, c=2;
initial begin 
$monitor($time,"monitor2\n a=%d,b=%d,c=%d",a,b,c);
#5 a<=3'd2;
#5 b<=3'd4;
#10 c<=3'd5;
end 
initial begin 
$display($time,"display2\n a=%d,b=%d,c=%d",a,b,c);
end 
endmodule 

module nonblockingtest3;
reg clk=1;
reg [2:0] a=2'b01 , b=2'b10 , c=2'b11;
always #2 clk=~clk;

always@(posedge clk) 
begin 
$monitor("monitor1\n,a=%d,b=%d,c=%d",a,b,c);
a<=5;
$display("display1\n,a=%d,b=%d,c=%d",a,b,c);
b<=a;
c<=b;
$display("display2\n,a=%d,b=%d,c=%d",a,b,c);
end
initial
begin 
//$dumpfile("dump.vcd"); $dumpvars;
#20 $stop;
end 
endmodule
    
//vsim -novopt  module name 
//add wave*

module nonblockingtest4;
reg[15:0]a,b;
reg x,y,z;
integer count ;
// all behavioral statements must be inside on initail and always block
initial 
begin 
x=0; y=1; z=1;  // scalar assignments 
count=0;
a=16'b0;
b<=a;
a[2]<=#10 1'b1;
b[15:13]<=#15 {x,y,z};
count<=count+1;
end 
initial begin
$monitor($time,"a=%b,b=%b,count=%h",a,b,count); 
#30 $stop;
end 
endmodule 

//// swap two no without using any other veriable /////////////////////////////////////////

module swap_the_twono;
integer a=3, b=5;
initial begin 
/*a=a^b;
b=a^b;
a=a^b;*/
a<=b;
b<=a;
$monitor("a=%d, b=%d",a,b);
end 
endmodule 
