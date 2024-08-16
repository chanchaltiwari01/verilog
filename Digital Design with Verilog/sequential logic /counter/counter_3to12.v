module counter3_to12( clk,clr,load,din,count);
  input [3:0] din;
  input clk,clr,load ;
  output reg [3:0] count ;
  
  always @(posedge clk)
   begin 
   if(clr)
   count <= 4'b0011;
   else if (load ==1'b1 && count <=4'b1100 && count >= 4'b0011)
   count <= din;
     else if (count >=4'b1100)
   count <= 4'b0011;
   else
   count <= count + 1'b1;
   end 
endmodule 


module test_counter3_to12;
    reg [3:0] din;
    reg clr, clk = 1'b1, load;
    wire [3:0] count;
    
    counter3_to12 u0 (
        .din(din),
        .clk(clk),
        .clr(clr),
        .load(load),
        .count(count)
    );
    
    always #10 clk = ~clk;
    
    initial begin
        $monitor("clr=%b, clk=%b, load=%b, din=%b, count=%b", clr, clk, load, din, count);
        clr = 1; load = 0; din = 0; #10;
        clr = 0; #50;
        din = 4'b1101; load = 0; #10;
      load=1; #10;
	  din = 4'b0010; load = 0; #10;
	   load=1; #10;
        load = 0; #100;
        din = 5; load = 1; #10;
        load = 0;
    end
    
    initial begin
    $dumpfile("dump.vcd");
      $dumpvars(1);
      #600; $stop;
    end
endmodule