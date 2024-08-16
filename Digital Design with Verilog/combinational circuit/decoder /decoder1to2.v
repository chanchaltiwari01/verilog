module decoder1to2(
   input in,
   output  reg [1:0] out );
   
   always@*
   begin
     if(in==1'b0)
	out=2'b01;
     else if (in==1'b1)
	out=2'b10;
	else 
	out = 2'b00;
   end 
 endmodule 
 
 module tets_decoder();
  reg in;
  wire [1:0] out ; 
  
  decoder1to2 u0(.in(in),.out(out));
  
  initial begin
  $monitor("in=%b,out=%b", in,out);
  in=1; #1;
  in=0; #1;
  in=1'bx; #1;
  $stop;
  end
 endmodule 
