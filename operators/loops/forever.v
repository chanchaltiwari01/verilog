module foreverloop;
initial 
begin
forever
 begin
$display("%t iteration",$time);
#5;
end
 end 
initial begin 
#50 $stop;
end 
endmodule 


module forever1;
reg clk=1'b0;
initial 
begin
forever #5 clk=~clk;
end 
initial 
begin
$display("clk=%b",$time,clk);
#50 $stop;
end
endmodule
