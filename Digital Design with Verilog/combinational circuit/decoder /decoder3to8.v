
module decoder3to8(
        input [2:0] in,
		output reg [7:0] out);
		
	always@* 
	  begin
	    case(in)
		3'b000 : out = 8'b0000_0001;
		  3'b001 : out = 8'b0000_0010;
		    3'b010 : out = 8'b0000_0100;
		       3'b011 : out = 8'b0000_1000;
		      3'b100 : out = 8'b0001_0000;
		    3'b101 : out = 8'b0010_0000;
		  3'b110 : out = 8'b0100_0000;
		 3'b111 : out = 8'b1000_0000;
		default : out = 8'b0;
	   endcase
	  end
endmodule 

module test_encoder;
  reg [2:0] in;
  wire [7:0] out;
   integer i;
  
  decoder3to8 u0(.in(in),.out(out));
   
 initial begin
   $monitor("input =%b , output =%b",in,out);
     for(i=0; i<=7; i=i+1)
    begin
	in=i;
	#1;
	end
	$stop;
 end 
endmodule  
