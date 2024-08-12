module task_increment;
  integer x=0;
  
  task increment;
    inout integer a;
    a=a+1;
  endtask 
  
  initial begin 
    increment (x);    /// task call 
    $display("x=%d",x);
    x=6;
    increment(x); /// task call again
    $display("x=%d",x);
  end 
endmodule 

////////////////////////////////////////////////////////////////////////////////////////////////////
module sum_of_no(a,b,c);
  input [7:0] a,b;
  output reg  [7:0] c;
  
  task sum;
    input [7:0] a,b;
    output  reg [7:0] c;
    begin
    c=a+b;
    end 
  endtask 
  
  initial begin : sum1
    reg [7:0] a,b,c;
    a=7;
    b=4;
    sum(a, b, c); // call task 
    $display("a=%d, b=%d, c=%d", a,b,c);
  end 
endmodule 


