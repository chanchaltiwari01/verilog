// parameter are use to declear a contants in verilog 
// these contants can be overridden during compilation time (test bench)
//keyword defparam use to overriding and also  use #() after the module name in a module instance
//#() and defparama both  are used ,the value of defparam will be used for overridding 

module custom_adder(a,b,cin,sum,cout);
	parameter size=4;
	input [size-1:0] a,b;
	input cin;
	output [size-1:0] sum ;
	output cout ;
	
	assign  {cout ,sum} = a+b+cin;

endmodule 

module adder_test;
	parameter size=4;
	reg cin;
	reg [size-1:0] a,b;
	wire cout ;
	wire [ size-1:0] sum;
	
	custom_adder u0(a,b,cin,sum,cout);

	initial begin
		$randomseed;
	end
	
// Stimulus generation
always  begin 
   
    a = $random;
    b = $random;
    cin = $random;
    #10;
end

// Monitor
initial begin
    $monitor("a=%d, b=%d, cin=%d, sum=%d, cout=%d", a, b, cin, sum, cout);
  #100 $stop;
end
endmodule
