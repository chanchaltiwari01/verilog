module con();
reg[1:0] a = 2'b01;
reg[2:0] b = 3'b110;
reg [1:0]c = 2'b10;

initial begin 

$display("a_b_c=%b",{a,b,c});
$display("a[0]_b[0]_c[0]=%b",{a[0],b[0],c[0]});
$display("a, 4'b1111=%b",{a,4'b1111});
end
endmodule
