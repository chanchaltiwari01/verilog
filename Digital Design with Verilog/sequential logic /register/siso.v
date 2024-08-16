// Serial-In Serial-Out (SISO) shift register

module sipo( 
    input din, rst, clk,
    output reg dout);
    reg [3:0] q;
    
    always @(posedge clk) begin
        if (rst)  
            q <= 4'b0;
        else begin
            q[3] <= din;
            q[2] <= q[3];
            q[1] <= q[2];
            q[0] <= q[1];
            dout <= q[0];
        end 
    end
endmodule

module test_siso;
    reg din, clk = 1'b0, rst;
    wire dout;
    
    // Instantiating sipo module instead of siso
    sipo u0 (
        .din(din),
        .rst(rst),
        .clk(clk),
        .dout(dout)
    );

    always #5 clk = ~clk;

    initial begin
        $monitor("clk=%b, rst=%b, din=%b, dout=%b", clk, rst, din, dout);
        $dumpfile("dump.vcd");
        $dumpvars;

        rst = 1; din = 1; #10;
        rst = 0; #50;
        din = 0; #50;
        $stop;
    end
endmodule
