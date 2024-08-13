module xor_gate (out ,a,b);
input a,b;
output reg out;
always@(a,b)
out =a^b;
endmodule 

module testxor;
reg a,b;
wire out ;
xor_gate ab(out,a,b);
initial 
{a,b}=2'b00;
always@(*)
begin
#5 {a,b}={a,b}+1'b1;
 end 
initial begin
$monitor($time,"a=%b ,b=%b ,out =%b",a,b,out);
 end 
endmodule 

////// clock generaton using always block ////

module clk_gen()
integer clk;
  
 initial 
     clk = 0;
  
 always 
     #5 clk = ~clk;
  
  initial begin
    $monitor("time[%0t]:clk=%0b",$time,clk);
    $dumpfile("clk.vcd");
    $dumpvars(1);
  end 
  
endmodule 

module dff(d,q,clk);
input d,clk;
output reg  q;
always@(posedge clk)
q=d;
endmodule 

module testdff;
reg d,clk;
wire q;

dff aa(d,q,clk);
initial begin 
$monitor($time,"clk=%b, d=%b, q=%b", clk,d,q);
d=0; clk=0;
#1 d=1;
#1 clk=1;
#1 d=0;
end 
endmodule 
