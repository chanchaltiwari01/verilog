//parallel-in Serial-Out (piso) shift register 

module piso(
     input clk,sin,load,rst,
	 input [3:0] din,
	 output dout);
  
  reg [3:0] q=4'b0000;
	 
	always@(posedge clk)
	 begin 
	  if(rst)
	   q <= 4'b0000;
	   else if(load)
	   q <= din;
	   else 
	    begin
		q[3] <= sin; //Serial-In
		q[2] <= q[3];
		q[1] <= q[2];
		q[0] <= q[1];
		 // serial out 
		end 
	end
  assign dout = q[0];
endmodule 

module test_piso;
  reg clk=1'b0,sin,load,rst;
  reg [3:0] din;
  wire dout ;
  
  piso u0(.clk(clk),.din(din),.sin(sin),.load(load),.rst(rst),.dout(dout));
  
  always #5 clk = ~clk;
  initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars(1);
    $monitor("clk=%b,rst=%b,load=%b,sin=%b, din=%b,dout=%b",
	                              clk,rst,load,sin,din,dout);
		
		din=4'b1111;sin=0; rst=1; load=0; #10 ;
		rst=0; load=1; #10;
		load=0;
		#40 ; sin=1;
		#50 ; $stop;
	end 
endmodule 
////////////////////////////////////////////////////////////////////////////////////////////////////////////
module piso_4bit (
    input wire clk,          
    input wire rst,
    input wire [3:0] parallel_in,
  input wire sin,
    output reg serial_out    
);

reg [3:0] register;   
always @(posedge clk or posedge rst) begin
    if (rst) begin
        register <= 4'b0000;
        serial_out <= 1'b0;
    #1  $display("reset: register=%b,serial_out=%b",register,serial_out);
    end 
  else begin
    serial_out <= register[0]; 
      register <= {sin, register[3:1]}; 
  #1  $display("load and shift: sin=%b, register =%b, serial_out=%b",sin,register,serial_out);      
    end
end

endmodule


`timescale 1ns / 1ps

module testbench;

    reg clk = 0;  
    reg rst = 0;
  reg sin;
  reg [3:0] parallel_in; 
    wire serial_out;       
 
  piso_4bit dut (.sin(sin),
        .clk(clk),
        .rst(rst),
        .parallel_in(parallel_in),
        .serial_out(serial_out)
    );

   
    always #5 clk = ~clk;

  
    initial begin
      $dumpfile("dump.vcd"); $dumpvars;
      $monitor("clk=%b,rst=%b,parallel_in=%b,shift=%b,serial_out",clk,rst,parallel_in,sin,serial_out);
      
      sin=1'b1;
        rst = 1; parallel_in = 4'b0000; #10;
        rst = 0; 
       #40; sin=0;
        # 50;  $stop; 
    end
endmodule 
