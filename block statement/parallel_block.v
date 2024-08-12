module fork_join;
  reg [5:0] data;
  
  initial fork
#10 data = 10; ;
#20 data = 30;
#9 data = 21;
#31 data = 21;
#1 data = 20;
#8 data=40;
join

  initial begin 
    $monitor("at [%0t] data=%0d",$time,data);
  end 
endmodule 
///////////////////////////////////////////////////////////////////////
module fork_join;
integer a=0,b=0,c=0,d=0,e;
initial fork 
#1 a=5;
#3 b=7;
#5 c=4;
#8 d=10;
#2 e=3; 
join 
initial begin
  $monitor("at[%0t] a=%0d, b=%0d, c=%0d, d=%0d, e=%0d",$time,a,b,c,d,e);
end 
endmodule

/////////////////////////////////////////////////////////////
module forkejion();
integer a=0,b=0,c=0,d=0,e=0;
initial
fork
$monitor($time,"a=%d , b=%d, c=%d , d=%d , e=%d", a,b,c,d,e);
a=5;
#3 b=7;
#24 c=4;
#1 d=10;
#18 e=9;
#12 a=12;
join
endmodule 
//////////////////////////////////nested fork_join ///////////////////////////////////////////////
module forkejion();
integer a=0,b=0,c=0,d=0,e=0;
initial
fork
a=5;
#3 b=7;
#24 c=4;
fork 
#3 b=7;
#24 c=4;
#1 d=10;
#18 e=9;
#12 a=12;
join
#1 d=10;
#18 e=9;
#12 a=12;
join
  initial begin
    $monitor("at the time of :%0t , [a=%0d]",$time,a);
  end 
endmodule 
