module full_adder(a,b,cin,sum,cout);
  input a,b,cin;
  output reg sum , cout ;
  wire x,y,z;
  
  // xor x0(x,a,b);
  // xor x1(sum,x,cin);
  // and a0(y,a,b);
  // and a1(z,x,cin);
  // or o0(cout,y,z);
  
  always @*begin    
    sum = a^b^cin;
    //cout =(a&b)|(b&cin)|(cin&a);
    cout=(a&b)|(cin&(a^b));
  end
  
endmodule 
 
 module test_full;
   reg a,b,cin;
   wire sum,cout;
   
   full_adder u0(a,b,cin,sum,cout );
   
   initial begin 
     integer i;
     for(i=0; i<=7; i=i+1)begin
       {a,b,cin}=i;
       #10;
     end 
   end 
   
   initial begin 
     $monitor("a=%b|b=%b|cin=%b|sum=%b|cout=%b|",a,b,cin,sum,cout );
   end 
endmodule 
