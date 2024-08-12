module cond();
reg [1:0] a,b;
reg c;
initial 
begin
a=2'b11;
b=2'b00;
c=1;
$display("x=%b",c?a:b);
end 
endmodule
