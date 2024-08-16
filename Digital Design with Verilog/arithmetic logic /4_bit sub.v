//4bit subtrator using full adder ///////////////////////////////////////

module sub_4bit(a,b,bin,dif,bout);
input [3:0] a,b;
input bin;
output [3:0] dif;
output bout ;
wire [2:0] bi;

full_adder u0(.sum(d[0],.cout(bi[0]),.a(a[0]),.b(~b[0]),cin(bin));
full_adder u1(.sum(d[1],.cout(bi[1]),.a(a[1]),.b(~b[2]),cin(bi[0]));
full_adder u2(.sum(d[2],.cout(bi[2]),.a(a[2]),.b(~b[2]),cin(bi[1]));
full_adder u3(.sum(d[3],.cout(bout),.a(a[3]),.b(~b[3]),cin(bi[2]));

endmodule 


module test_sub_4bit;
reg [3:0] a,b;
reg bin=1'b1;
wire bout ;
wire [3:0] dif;

sub_4bit u0(a,b,bin,dif,bout);

  initial begin
  
  integer i,j,k;
  for(i=0;i<16;i=i+1)
 begin
 for(j=0;j<16;j=j+1)
 begin
   for(k=0;k<2;k=k+1)
   begin
      $display("| time=%0t | a=%b | b=%b | bin=%b | dif=%b | bout=%b |",$time,a,b,bin,dif,bout);
 a=i;
 b=j;
 bin=k;
     #1;
 end 
 end 
 end 
 end 
endmodule

//////////////4bit full subtractor using 1 bit subtractor ////////////////////////////////
              //full subtractor //////////
module full_sub(a,b,bin,dif,bout);
  input a,b,bin;
  output reg dif,bout ;
  always @*begin
    dif = a^b^bin;
    bout = ((~a ) & b) | ((~(a^b) & bin));
  end 
endmodule 

//4bit full subtractor using 1 bit subtractor 
module subtrator_4bit(a,b,bin,diff,bout);
  input [3:0] a,b;
  input bin;
  output [3:0] diff ;
  output bout;
  wire [2:0] bi;

full_sub u0(.a(a[0]),.b(b[0]),.bin(bin),.dif(diff[0]),.bout(bi[0]));
full_sub u1(.a(a[1]),.b(b[1]),.bin(bi[0]),.dif(diff[1]),.bout(bi[1]));
full_sub u2(.a(a[2]),.b(b[2]),.bin(bi[1]),.dif(diff[2]),.bout(bi[2]));
full_sub u3(.a(a[3]),.b(b[3]),.bin(bi[2]),.dif(diff[3]),.bout(bout));

endmodule 



module test_sub_4bit;
reg [3:0] a,b;
reg bin;
wire bout ;
wire [3:0] diff;

  subtrator_4bit u0(.a(a),.b(b),.bin(bin),.diff(diff),.bout(bout));

  initial begin
  
  integer i,j,k;
  for(i=0;i<16;i=i+1)
 begin
 for(j=0;j<16;j=j+1)
 begin
   for(k=0;k<2;k=k+1)
   begin
      $display("| time=%0t | a=%b | b=%b | bin=%b | diff=%b | bout=%b |",$time,a,b,bin,diff,bout);
     $display("decimal | time=%0t | a=%d | b=%d | bin=%d | diff=%d | bout=%d |",$time,a,b,bin,diff,bout);
 a=i;
 b=j;
 bin=k;
     #1;
 end 
 end 
 end 
 end 
endmodule 
