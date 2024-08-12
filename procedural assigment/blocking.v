///blocking statements//////////
// denote by  " = "

module block_test;
reg [1:0] a=2'b01 , b=2'b10 , c=2'b11;
initial 
begin 
$monitor("monitor1\n,a=%b,b=%b,c=%b",a,b,c);
a=2'b00;
b=a;
c=b;
end 
endmodule

module blocktest2;
reg [2:0] a=3 , b=1, c=2;
initial begin 
$monitor($time,"monitor2\n a=%d,b=%d,c=%d",a,b,c);
#10 a=3'd2;
#5 b=3'd4;
#5 c=3'd5;
end 
endmodule 



module blocktest3;
reg x,y,z;
reg[15:0] a,b;
integer count ;
initial begin
$monitor($time,"a=%b,b=%b,count=%b",a,b,count); 
x=0; y=1; z=1;
count=0;
a=16'b0;
b=a;
#10  a[2]=1'b1;
#10  b[15:13]={x,y,z};
count =count+1;
end 
endmodule 

#                    0a=0000000000000000,b=0000000000000000,count=0
#                   10a=0000000000000100,b=0000000000000000,count=0
#                   20a=0000000000000100,b=0110000000000000,count=1*/


