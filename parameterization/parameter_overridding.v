/////////////////////////////////////////////////////////////////////
module mux(inp,sel,op);
  parameter sel_width=2;
   //localparam same as parameter ,value cannot be overriden
	// localparam inp_width=2**sel_width;
  parameter inp_width=4;
  input [sel_width-1:0] sel;
  input [inp_width-1:0]inp;
  output op;
  assign op=inp[sel];
     
      initial begin
	      #1;
	      $display("inside mux inp=%b, sel=%b",inp,sel);
	      //inside mux inp=0011, sel=01
	      // after change the value in test //inside mux inp=0011, sel=01 
	      //after overridding  inside mux  inp=0110001111100000101011001100011, sel=01101
      end 
endmodule 


module test ;
	parameter n=2; //  inside test  inp=0011, sel=01
	parameter m=4;
	// parameter n=5; //  inside test inp=0110001111100000101011001100011, sel=01101
	// parameter m=32; 
	reg [n-1:0] sel;
	reg [m-1:0] inp;
	wire op;
	mux m1(.inp(inp),.sel(sel),.op(op));
	
	//parameter overridding 
	defparam m1.sel_width=5;
	defparam m1.inp_width=32;
	//  inside test inp=0110001111100000101011001100011, sel=01101
	
	initial begin
		inp=$random;
		sel=$random;
		$display("inside test inp=%b, sel=%b",inp,sel);
	end
endmodule 

/////////////////////defparam //////////////////////////////////////////
module secret_number;
  parameter my_secret = 0;
  initial begin 
    $display("d1 my secret number is %b", my_secret);
  end 
endmodule

module defparam_example;
  defparam u0.my_secret = 11;
  defparam u1.my_secret = 21;
  
  secret_number u0();
  secret_number u1();
  
  initial begin 
    $display("u0 my secret number is %d", u0.my_secret);
    $display("u1 my secret number is %d", u1.my_secret);
  end 
endmodule
