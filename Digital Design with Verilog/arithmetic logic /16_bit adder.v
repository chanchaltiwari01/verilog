// 16-bit adder ;
module adder_16bit(sum,cout,a,b,cin);
input [15:0] a,b;
input cin;
output reg [15:0] sum;
output reg cout ;

always @* // * use for all sensitivity veriable 
begin 
  {cout ,sum}= a+b+cin;
end 
endmodule 

module test_16bit_adder ;
reg [15:0] a,b;
reg cin;
wire [15:0] sum;
wire cout ;

adder_16bit u0(
        .a(a),
		.b(b),
		.cin(cin),
		.cout(cout),
		.sum(sum)
		);
		
	initial begin
	 a=16'haaaaaaaaaaa;
	 b=16'haaaaaaaaaa;
	 cin=1'b0;
      #100;
      a=16'ha;
      b=16'hb;
     
	 end 
	 always #2 b=b+1'b1;
	 always #4 a=a+1'b1;
	 always #1 cin=~cin;
	 
	 initial begin
	 $monitor("time=%0t, a=%d,b=%d,cin=%d,sum=%d,cout=%d",$time,a,b,cin,sum,cout);
	 #200 ;
	 $stop;
	 end
	 endmodule 
