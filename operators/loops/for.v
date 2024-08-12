module forloops;
integer count ;
initial  begin 
for(count=0;count<=20;count=count+1)
$display("count=%d",count);
end 
endmodule
