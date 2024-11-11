module ROM(clk,addr,data);
    input clk ;
    input [7:0] addr;
    output reg [15:0] data ;

    reg [15:0] MEM [255:0] ;
    
    initial begin
        MEM[0] = 'haa;
        MEM[220] = 'hbb;
        MEM[10] = 'hcc;
        MEM[20] = 'hdd;
        MEM[40] = 'hff;
        MEM[50] = 'hee;
        MEM[60] = 'h1a;     
    end

    always@(posedge clk ) begin
        data = MEM[addr] ;       
    end
endmodule 

module tb_rom;
    reg clk ;
    reg[7:0]  addr ;
    wire [15:0] data ;

    ROM dut(.clk(clk),.addr(addr),.data(data));

    always  #5 clk = ~ clk;

    initial begin
       clk=0; addr = 0 ; #10;
        addr = 220 ; #10 ;
        addr = 10; #10;
        addr = 20; #10;
        addr = 30; #10;
        addr = 40; #10;
        addr = 50; #10;
        addr = 60; #10;
        $stop;
    end

    initial begin
        $dumpfile("rom.vcd");
        $dumpvars(1);
        $monitor("[%0t] clk=%0b , addr=%0d , data=%0h",$time,clk,addr,data);
    end
endmodule

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

module rom #(parameter width = 8 , depth =64 , addr_width =7)
       (input clk,
       input [addr_width-1:0] addr,
       output reg [width-1:0] data
       );
 
   //declaration of rom 
   reg [width-1:0] ROM [0:depth-1] ;
   
   initial begin
     $readmemb("data.mif",ROM);
   end

   always @(posedge clk ) begin
    data <= ROM[addr];
   end
endmodule

module rom_tb;
    reg clk;
    reg [6:0] addr;
    wire [7:0] data;
    integer i;
 rom dut(.clk(clk),.addr(addr),.data(data));

     always #5 clk = ~clk ;
 initial begin
    clk=0; 
     for(i=0;i<64 ; i = i+1) begin
        addr = i ;
        #10;
     end 
   $stop;
  end 
       
 initial begin
        $dumpfile("ROM.vcd");
        $dumpvars(1);
        $monitor("[%0t] clk=%0b , addr=%0d , data=%0h",$time,clk,addr,data);
    end
endmodule 
