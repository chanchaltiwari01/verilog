///// continuous assignment delay use only in dataflow modeling ///////////


///// net declaration delay ///////
module netdeclartion(a,b,c);
input a,b;
output #10 c;
assign c=a^b;
endmodule


//////// regular assignement delay /////

module regular(a,c,b);
input a,b;
output c;
assign #10 c=a&b;
endmodule 



//////////  implicit delay /////
module implicit(a,b,c);
input a,b;
output #10 c=a&b;
endmodule 
