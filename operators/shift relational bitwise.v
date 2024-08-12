module sh_re_bi();
reg [3:0] a,b,c;
reg signed [5:0]d;
initial 
begin 
a=4'b0101;
b=4'b1011;
c=4'b1101;
d=6'b101101;
$display("a&b=%b",a&b); // bitwise
$display("a|c=%b",a|c);
$display("&a=%b",&a);
$display("^b=%b",^b); //reduction
$display("d>>2=%b",d>>2);//shift
$display("b<<3=%b",b>>3);
$display("d>>>3=%b",d>>>3);  // arithmetic shift 
$display("b>>-1=%b",b>>-1); // error don't exist in verilog 
$display("a<<1'bx=%b",a<<1'bx);
end 
endmodule 
