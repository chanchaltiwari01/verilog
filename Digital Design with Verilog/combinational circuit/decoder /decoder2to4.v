 
 module decoder2to4(
    input [1:0] in,
	output reg [3:0] out);
	
	always@*
	begin
	 case (in)
	 2'b00: out = 4'b0001;
	  2'b01: out = 4'b0010;
	   2'b10: out = 4'b0100;
	  2'b11: out = 4'b1000;
	 default : out = 4'b0;
	 endcase
	end
endmodule 

// RTL coding (data flow)

module decoder2to4(
  input [1:0] in,
  output [3:0] out );
  wire a,b;
  
  not n0(a,in[0]);
  not n1(b,in[1]);
  and a0(out[0],a,b);
  and a1(out[1],a,in[1]);
  and a2(out[2],in[0],b);
  and a3(out[3],in[0],in[1]);
  
endmodule 


// 2 to 4decoder using if else conditional statement 

module decoder2to4( 
  input [1:0] in,
  output  reg [3:0] out );
  
  always@* 
    begin
      if(in==2'b00)
        out = 4'b0001;
      else if(in==2'b01)
        out = 4'b0010;
      else if (in==2'b10)
        out = 4'b0100;
      else if(in==2'b11)
        out = 4'b1000;
      else
        out = 4'b0;
    end
endmodule 



module test_decoder();
  reg [1:0] in;
  wire [3:0] out ;
  integer i;
  
  decoder2to4 u0(.in(in),.out(out));
  initial begin
  $monitor("input=%b, output =%b", in,out);
   	for(i=0; i<=3; i=i+1) begin
	in=i;
	#1;
	end
    $stop;
  end
endmodule 
