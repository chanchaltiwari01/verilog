module full_adder(a,b,cin,sum,cout);
  input a,b,cin;
  output reg sum , cout ;
  
  always @* begin
    sum = a^b^cin;
    //cout =(a&b)|(b&cin)|(cin&a);
    cout=(a&b)|(cin&(a^b));
  end
endmodule 
 
 
 
module full_adder_4bit(a,b,cin,sum,cout);
  input[3:0] a,b;
  input cin;
  output cout;
  output [3:0] sum;
  wire [2:0] c;

  full_adder u0(.sum(sum[0]),.cout(c[0]),.a(a[0]),.b(b[0]),.cin(cin));
  full_adder u1(.sum(sum[1]),.cout(c[1]),.a(a[1]),.b(b[1]),.cin(c[0]));
  full_adder u2(.sum(sum[2]),.cout(c[2]),.a(a[2]),.b(b[2]),.cin(c[1]));
  full_adder u3(.sum(sum[3]),.cout(cout),.a(a[03]),.b(b[3]),.cin(c[2]));
endmodule 

module test_4bit_adder;
  reg [3:0] a,b;
  reg cin;
  wire cout ;
  wire [3:0] sum;
  
  full_adder_4bit u0(a,b,cin,sum,cout);
  
  initial begin
    a=4'b0000;
    b=4'b0000;
    cin=1'b0;
    #10;
  end
  always #32 a=a+1'b1;
  always #2 b=b+1'b1;
  always #1 cin=~cin;
  initial begin
    $monitor("| time=%0t | a=%b | b=%b | cin=%b | sum=%b | cout=%b |",$time,a,b,cin,sum,cout);
 end
  
  initial begin
    if (a==4'b1111) 
      begin
        #4 $stop;
      end
  end
  endmodule 

module test_4bit_adder;
  reg [3:0] a,b;
  reg cin;
  wire cout ;
  wire [3:0] sum;
  
  full_adder_4bit u0(a,b,cin,sum,cout);
  
  initial begin
  integer i,j,k;
    for(i=0;i<16;i=i+1) begin
      for(j=0;j<16;j=j+1) begin
        for(k=0;k<2;k=k+1)   begin
          $display("| time=%0t | a=%b | b=%b | cin=%b | sum=%b | cout=%b |",$time,a,b,cin,sum,cout);
          a=i;
          b=j;
          cin=k;
          #1;
        end 
      end 
    end
  end 
endmodule 
