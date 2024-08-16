module up_couneter_sync(
    input clk, reset,
  output reg [3:0] q=4'b0000
);

always @(posedge clk) begin
    if (reset)
        q <= 4'b0;
    else
        q <= q + 1'b1;
end

endmodule

module test_up_counter_sync;

    reg clk=1'b0, reset;
    wire [3:0] q;

    up_couneter_sync uut (
        .clk(clk),
        .reset(reset),
        .q(q)
    );
always #5 clk =~clk;
    initial begin
        reset = 1;
        #10 reset = 0;
        #60 reset = 1;
        #10 reset = 0;
        #100 $stop;
    end
  initial begin
    $monitor(" clk=%b, reset=%b, q=%d", clk,reset,q);
    $dumpfile("dump.vcd"); $dumpvars(1);
  end 
endmodule
