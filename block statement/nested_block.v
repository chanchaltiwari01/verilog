module beginforkjion();
integer a=0,b=0,c=0,d=0,e=0,f=0;
initial
begin
$monitor($time,"a=%d , b=%d, c=%d , d=%d , e=%d ,f=%d", a,b,c,d,e,f);
a=5;
#3 b=7;
#5 c=4;
fork
#8 d=10;
#3 {a,b} = {7,9};
#5 {f,e} = {9,3};
join 
#6 d=12;
#2 e=9;
#12 a=12;
end
endmodule 

///////////////////////////////////////////////////////////////////
module forkjionbegin();
integer a=0,b=0,c=0,d=0,e=0,f=0;
initial
fork
$monitor($time,"a=%d , b=%d, c=%d , d=%d , e=%d ,f=%d", a,b,c,d,e,f);
a=5;
#3 b=7;
#5 c=4;
begin
#8 d=10; //8
#3 {a,b} = {7,9};//11
#5 {f,e} = {9,3};//16
end
#6 d=12;
#2 e=9;
begin
#12 a=12; //12
#12 b=13; // 24
end 
#18 a=2;
join
endmodule 

