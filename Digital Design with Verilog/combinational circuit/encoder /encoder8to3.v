// 8 to 3 encoder 

module  encoder_8to_3(
      input [7:0] data,
	  output reg [2:0] out);
	  
   always @*
     begin
	    case (data)
		8'b0000_0001: out = 3'b000;
			  8'b0000_0010: out = 3'b001;
			    8'b0000_0100: out = 3'b010;
				   8'b0000_1000: out = 3'b011;
					  8'b0001_0000: out = 3'b100;
					8'b0010_0000: out = 3'b101;
				8'b0100_0000: out = 3'b110;
			8'b1000_0000: out = 3'b111;
		  default : out = 3'b000;
		endcase
	 end
endmodule 

module test_encoder8;
reg [7:0] data;
wire [2:0] out ;
integer i;
  
encoder_8to_3 u0(.data(data),.out(out));

initial 
  begin 
    for(i=1; i<=128 ; i=i*2) 
    begin
    data=i;
      #2;
      end
    end 
initial 
  begin 
$monitor("data=%b, out=%b",data,out);
     end
endmodule 

// encoder 8to 3  using if esle 

module encoder (data,out);
input [7:0] data;
output reg [2:0] out ;

always@*
 begin
  if(data=='d1)
 out = 3'b000;
  else if (data=='d2)
 out =3'b001;
  else if (data=='d4)
 out =3'b010;
  else if (data=='d8)
 out =3'b011;
  else if (data=='d16)
 out =3'b100;
  else if (data=='d32)
 out =3'b101;
  else if (data=='d64)
 out =3'b110;
  else if (data=='d128)
 out =3'b111;
 else
 out =3'b000;
 end
 endmodule 



module test_encoder8;
reg [7:0] data;
wire [2:0] out ;
integer i;
  
encoder u0(.data(data),.out(out));

initial 
  begin 
    for(i=1; i<=128 ; i=i*2) 
    begin
    data=i;
      #2;
      end
    end 
initial 
  begin 
$monitor("data=%b, out=%b",data,out);
     end
endmodule 
