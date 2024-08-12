//////RACE AROUND CONDITION IN BLOCKIN AND NON BLOCKING ASSIGNMENTS//////

module race_around1;
reg [1:0] a=2'b01,b=2'b10 ;
initial begin 
$display("display1 a=%b , b=%b",a,b);
end
initial 
a=b;
initial 
b=a;
initial begin 
$display("display2 a=%b , b=%b",a,b);
end
endmodule  
/* output 
# display1 a=01 , b=10
# display2 a=10 , b=10
definitely both a and b will be same 
deends upon which initial block executes first that depends upon the simulator */

module race_around2;
reg [1:0]a=2'b01, b=2'b10;
initial 
#0 a=b;
initial 
b=a;
initial begin 
$display("display2 a=%b , b=%b ",a,b);
end 
endmodule 
/* output ////
# display2 a=01 , b=01 
#0(ZERO DELAY) assures that  stateent is executed at last after all 
statements in current simulation time are executed.
*/


module race_around3;
reg[1:0] a=2'b01 ,b=2'b10;
initial 
a<=b;
initial 
b<=a;
initial begin 
#1 $display("display2 a=%b , b=%b ",a,b);
end 
endmodule 

// output  # display2 a=10 , b=01 
