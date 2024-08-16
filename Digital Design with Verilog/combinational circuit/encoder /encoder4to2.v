//4 to  2 encoder 

module encoder4_to_2(
  input [3:0] data ,
  output reg [1:0] out);
  
  always @*
   begin
  case(data)
    4'b0001: out =2'b00; 
	4'b0010: out =2'b01; 
	  4'b0100: out =2'b10;
	    4'b1000: out =2'b11;
		  default: out =2'b00;
	 endcase 
	end 
endmodule 

module test_encoder4;
reg [3:0] data;
wire [1:0] out ;

encoder4_to_2 u0(.data(data),. out(out));
initial 
  begin
  $monitor("data=%b, out=%b", data,out );
     data=4'b0001; #10;
	 data=4'b0010; #10;
	  data=4'b0100; #10;
	   data=4'b1000; #10;
	    data=4'b1001; #10;
		$stop;
	end 
endmodule 
