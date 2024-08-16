// priority encoder 4to 2 

module priority_encoder (
   input [3:0] data,
  output reg [1:0] out,
    output reg v);
  always@*
    begin 
	 casex(data)
	   4'b0001: out=2'b00;
	     4'b001x: out=2'b01;
		   4'b01xx: out=2'b10;
	         4'b1xxx: out=2'b11;
			  default : out=2'b00;
	    endcase
	end
	always @* begin
      if(data>=1)
	v=1'b1;
      else 
        v=1'b0;
	end 
endmodule 


//RTL / DATA FLOW DESIGN 

module priority_encoder( 
  input [3:0] data ,
  output v,
  output [1:0] out );
  
    wire a,b;
  
  not n0(a,data[2]);
  and a1(b,a,data[1]);
  or o0(out[1],data[3],data[2]);
  or o1(out[0],b,data[3]);
  or o2(v,data[0],data[1],data[2],data[2]);
  
endmodule 


module test_priority;
reg [3:0] data;
wire[1:0] out;
wire v;

priority_encoder uo(.data(data),.out(out),.v(v));
initial begin
integer i;
  for(i=0;i<=15;i=i+1) begin
data=i;
#1; 
end 
end
initial begin
$monitor("data=%b,v=%b,out =%b",data,v,out);
end 
endmodule 
