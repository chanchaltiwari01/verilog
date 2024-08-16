/// single port ram 

module RAM(clk,wr,addr,data_in,data_out);
input clk,wr;
input [6:0] addr;
input [7:0] data_in;
output reg [7:0] data_out ;

reg [7:0] MEM [63:0] ;

always@(posedge clk ) begin
if(wr) 
 MEM[addr] = data_in ;
else
data_out = MEM[addr] ;
end
endmodule 


