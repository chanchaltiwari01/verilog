///////////////// if else ///////////////////////////////

module checkcondi(input a,b,sel,output reg out);
always@(sel)
begin 
if(sel==0)
out=a;
else 
out=b;
end 
endmodule 

module testcond;
reg a,b,sel;
wire out ;

checkcondi u0(a,b,sel,out);
initial begin
$monitor("sel=%b ,a=%b ,b=%b ,out=%b",sel,a,b,out);
sel=0; a=1;
#10 ;
sel=1;
b=0;
end 
endmodule 


////////////////////if else, else if  statement ////////////
module all_gate(m,a,b,p,q,r,s);
  input a,b;
  input[1:0] m;
  output reg p,q,r,s;
  
  always@(m,a,b)begin
    if(m==2'b00)
      assign p=a|b;
    else if (m==2'b01)
      assign q=a&b;
    else if (m==2'b10)
      assign r=a^b;
    else 
      assign s=(a^~b);
  end 
endmodule 

module testall;
  reg a,b;
  reg [1:0]m;
  wire p,q,r,s;
  integer i,j;
  all_gate u1(m,a,b,p,q,r,s);
  initial 
    begin 
      for(i=0;i<4;i=i+1)begin
        for(j=0;j<4;j=j+1)begin
          m=j;
          {a,b}=i;
          #5;
        end 
      end
    end
  
  initial begin
    $monitor("m=%b, a=%b ,b=%b ,p=%b ,q=%b ,r=%b ,s=%b",m,a,b,p,q,r,s);
  end 
endmodule
