//$strobe  is similar to $display 
// $strobe atomatically add new line 
//$strobe displays data at the end  of the end of
//current simulation time 
module strobe;
reg [2:0] a=3'b000, b=3'b000;
initial begin 
a=3'b011;
$display("display1: a=%b b=%b",a,b);
$strobe("strobe1: a=%b b=%b", a,b);
b=3'b111;
#10;
$strobe("strobe2: a=%b b=%b", a,b);
b=3'b101;
$display("display2: a=%b b=%b",a,b);
a=3'b110;
end 
endmodule 
