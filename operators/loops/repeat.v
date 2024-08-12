module repeatloop;
integer count;
initial begin
count =0; 
repeat (21)
begin  
$display("count=%d",count);
#1 count =count+1;
end 
end 
endmodule
