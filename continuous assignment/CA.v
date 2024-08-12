////////////// continuous assignment /////////// assign keyword 
 ///// sytax --- assin target=expression;/////////

module test_assign(a,b,x,y,z);
input a,b;
output x,y,z;
assign x= a&b;
assign y= a||b;
assign z= a^b;
endmodule 

  
module testassign();
reg a,b;
wire x,y,z;
  
 test_assign aa1(a,b,x,y,z);//positional connection 
//or_gate(.a(a),.b(b),.y(y)); ////name port connection  
initial
 begin 
$monitor("a=%b ,b=%b,x=%b ,y=%b z=%b",a,b,x,y,z);
a=0; b=0;
#10 b=1;
#10 a=1; b=0;
#10 b=1;
end
endmodule 
