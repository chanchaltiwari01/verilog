
module left_shift (
    input clk, rst, load, sin,
    input [3:0] din,
    output reg [3:0] q );

    always @(posedge clk) begin  
        if (rst)
            q <= 4'b0000;
        else if (load)
            q <= din;
        else
            q <= {q[2:0], sin};
    end 
		
endmodule 

module test_left_shift;
    reg clk = 0, clr = 0, load = 0, sin = 0;
    reg [3:0] din = 4'b1111;
    wire [3:0] q;
	
    left_shift u0 (
        .clk(clk),
        .rst(clr),
        .load(load),
        .sin(sin),
        .din(din),
        .q(q)
    );

    always #5 clk = ~clk;

    initial begin
        clr = 1; // Reset initially
        din = 4'b1111; // Set input data
        #10;
        clr = 0; // Release reset
        #10;
        load = 1; // Load data
        #10;
        load = 0; // Release load
        #10;
        sin = 0; // Shift in a '0'
        #10;
        sin = 0; // Shift in a '0'
        #10;
        sin = 0; // Shift in a '0'
        #10;
        sin = 0; // Shift in a '0'
        #10;
        sin = 1; // Shift in a '1'
        #10;
        $stop;
    end
    
    initial begin 
        $monitor("clk=%b, clr=%b, load=%b, sin=%b, din=%b, q=%b", clk, clr, load, sin, din, q);
      $dumpfile("dump.vcd");
        $dumpvars(1);
    end  
endmodule
