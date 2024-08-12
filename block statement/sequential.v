module test;
  reg  [5:0] a=0;
 initial
    begin
      $display("display at time[%0t] a=%0d",$time,a);
      a=4;
       #4 $display("display at time[%0t] a=%0d",$time,a); 
      a=9;
	   #5 $display("display at time[%0t] a=%0d",$time,a);
      a=16;
	   #7 $display("display at time[%0t] a=%0d",$time,a);
      a=17;
	  #1 $display("display at time[%0t] a=%0d",$time,a);  
      a=20;
	  #3 $display("display at time[%0t] a=%0d",$time,a); 
	end
endmodule
/////////////////////////////////////////////////////////////////////////////////////////////////////////
module begin_end;
integer a=0,b=0,c=0,d=0,e;
initial begin 
a=5;
#3 b=7;
#5 c=4;
#8 d=10;
#2 e=3;
end 
initial begin
  $monitor("at[%0t] a=%0d, b=%0d, c=%0d, d=%0d, e=%0d",$time,a,b,c,d,e);
end 
endmodule

////////////////////////////NESTED BEGIN END  /////////////////////////////////////////////
module nested_begin_end;
integer a=0,b=0,c=0,d=0,e;
initial begin 
a=5;
#3 b=7;
#5 c=4;
  begin
a=5;
#3 b=7;
#5 c=4;
#6 d=10;
#2 e=9;
#12 a=12;
end
#8 d=10;
#2 e=3;
end 
  
initial begin
  $monitor("at[%0t] a=%0d, b=%0d, c=%0d, d=%0d, e=%0d",$time,a,b,c,d,e);
end 
endmodule
