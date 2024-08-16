module RAM(clk,wr,addr,data_in,data_out);
  input  clk, wr;
  input  [5:0] addr;
  input  [7:0] data_in;
  output reg [7:0] data_out;

    // Memory array declaration
  reg [7:0] MEM [63:0]; // 64 locations, 8-bit wide

    // Synchronous read and write
    always@(posedge clk) begin
        if (wr) 
            MEM[addr] <= data_in; 
        else
            data_out <= MEM[addr]; 
    end
endmodule

module tb_RAM;

    reg clk,wr;
    reg [5:0] addr;
    reg [7:0] data_in;
    wire [7:0] data_out;	

    // Instantiate the RAM module
    RAM uut (
        .clk(clk),
        .wr(wr),
        .addr(addr),
        .data_in(data_in),
        .data_out(data_out)    );

    // Generate a clock
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10 ns period
    end

    initial begin
        // Reset
        wr = 1;
        addr = 'h0;
        data_in = 'h0;
        #10 ; wr=0;

        #10;
        wr = 1;
        addr = 7'h01;
        data_in = 8'hAA;
        #10  wr = 0;
      
        #10;
        wr = 1;
        addr = 7'h02;
        data_in = 8'hBB;
        #10 ;  wr = 0;
      
        #10;
        wr=1;
        addr = 7'h02;
        data_in = 8'hCC;
        #10; wr=0;
        #20; $stop;
    end

    // Monitor signals
    initial begin
        $monitor("At time %t, wr = %b, addr = %h, data_in = %h, data_out = %h",
                 $time, wr, addr, data_in, data_out);
      $dupmfile("dump.vcd");
      $dumpvars(1);
    end

endmodule


//synchronous red write ram
module RAM1(addr,data,clk,rd,wr,cs);
input [9:0] addr ; // address
input clk,rd,wr,cs; // cs chip select ,rd read ,wr write
inout [7:0] data; // default wire

// memory declaration
reg [7:0] MEM [1023:0] ;

// temp out
reg [7:0] temp_out;

always@(posedge clk) begin
if(cs && wr && !rd)
MEM[addr] <= data ;
end

always@(posedge clk) begin
if(cs && rd && !wr)
temp_out <= MEM[addr] ;
end

assign data = (cs && rd ) ? temp_out : 8'bz;

endmodule 


module RAM_tb;

  // Testbench signals
  reg [9:0] addr;
  reg clk, rd, wr, cs;
  wire [7:0] data;
  
  // Bidirectional data signal, need to drive it from both the RAM and testbench
  reg [7:0] data_tb;
  
  assign data = (wr) ? data_tb : data; // Drive data during write, tri-state otherwise
  
  // Instantiate the RAM module
  RAM1 uut(
    .addr(addr),
    .data(data),
    .clk(clk),
    .rd(rd),
    .wr(wr),
    .cs(cs)
  );
  
  // Clock generation
  always begin
    #5 clk = ~clk; 
  end

  
  initial begin   
    clk = 0;  cs = 0;  wr = 1;  rd = 0;
    addr = 0; data_tb = 8'b0;  
    $display("Read Data at addr 1: %h", data); 
    
    #10;
    cs = 1;   wr = 1;   rd = 0;
    addr = 10'h1; 
    data_tb = 8'hAA;    
    #10; wr = 0; rd = 1;
    $display("Read Data at addr 1: %h", data); 
    
    #10;   cs = 1;  wr = 1; rd=0;
    addr = 10'h2; 
    data_tb = 8'hbb; 
    
    #10;  wr = 0;  rd = 1;
   $display("Read Data at addr 2: %h", data); 
    
     #10;   cs = 1;  wr = 1; rd=0;
    addr = 10'h120; 
    data_tb = 8'hdd; 
    
    #10;  wr = 0;  rd = 1;
   $display("Read Data at addr 2: %h", data); 
    
     #10;   cs = 1;  wr = 1; rd=0;
    addr = 10'h100; 
    data_tb = 8'hff; 
    
    #10;  wr = 0;  rd = 1;
   $display("Read Data at addr 2: %h", data); 
    
    #10;
    $finish;
  end
  initial begin
    $dumpfile("ram.vcd");
    $dumpvars(1);
    end 

endmodule



module RAM2(
  input [9:0] addr,   // address
  input clk,          // clock
  input rd, wr, cs,   // chip select, read, write
  input [7:0] data_in, // input data
  output reg [7:0] data_out // output data
);

  // memory declaration 
  reg [7:0] MEM [0:1023]; // 1024 locations
  
  always @(posedge clk) begin
    if (cs && wr && !rd)
      MEM[addr] <= data_in;
  end 
  
  always @(posedge clk) begin
    if (cs && rd && !wr)
      data_out <= MEM[addr];
  end
  
endmodule

module test_RAM;

  reg [9:0] addr;
  reg clk, rd, wr, cs;
  reg [7:0] data_in;
  wire [7:0] data_out;
  
  RAM2 dut(.addr(addr),
    .data_in(data_in),
    .data_out(data_out),
    .clk(clk),
    .rd(rd),
    .wr(wr),
    .cs(cs)
  );
  
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // generate clock with 5 time unit period
  end 
  
  initial begin
    read();
    write();
    $dumpfile("dump.vcd"); $dumpvars;
    cs = 1; wr = 1; rd = 0; clk = 0;
    addr = $random;
    data_in = $random;
    
    #10; wr = 0; rd = 1;
    
    #10; 
    wr = 1; rd = 0;
    addr = $random;
    data_in = $random;
    #10; wr = 0; rd = 1;
   
    #10;    
    addr = $random;
    data_in = $random;
    
    #10; wr = 0; rd = 1;
    
    #10; $stop;
  end 
  
 task read;
   $monitor(" read :rd=%0d, data_out[%h]=%h", rd,addr, data_out);
 endtask 
  
  task write;
    $monitor(" write :wr=%0d, data_in[%h]=%h", wr, addr, data_in);
  endtask  
    
endmodule


//////////////////////////////////////////////////////////////////////
module RAM45 #(parameter addr_width=6, data_width=32, depth=64) (
    input clk, rst, en, wr_rd,
    input [data_width-1:0] data_in,
    input [addr_width-1:0] addr,
    output reg out_en,
    output reg [data_width-1:0] data_out );
    integer i ;

    reg [data_width-1:0] MEM [depth-1 : 0];

    always @(posedge clk) begin
        if (en) begin
            if (rst) begin
                data_out <= 0;
                out_en <= 0;
                for (i = 0; i < depth; i = i + 1) begin
                    MEM[i] <= 0;
                end
            end else begin
                if (wr_rd == 1) begin
                    MEM[addr] <= data_in;
                end else begin
                    data_out <= MEM[addr];
                    out_en <= 1;
                    @(posedge clk);
                    out_en <= 0;
                end
            end
        end else begin
            $display("MEM is disabled");
        end
    end
endmodule

`define addr_width 6
`define data_width 32
`define depth 64

module top5;
    reg clk, rst, en, wr_rd;
    reg [`data_width-1:0] data_in;
    reg [`addr_width-1:0] addr;
    wire out_en;
    wire [`data_width-1:0] data_out;

    reg [`data_width-1:0] temp [`depth-1:0]; // internal mem of tb

    // local vars
    reg [`data_width-1:0] data_out_l;
    reg [`addr_width-1:0] addr_l;

    RAM45 dut(
        .clk(clk),
        .rst(rst),
        .en(en),
        .wr_rd(wr_rd),
        .out_en(out_en),
        .addr(addr),
        .data_in(data_in),
        .data_out(data_out)
    );

    // clk generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // rst generation
    initial begin
        en = 0;
        rst = 1;
        #10
        en = 1;
        #10;
        rst = 0;
    end

    initial begin
      repeat(20) begin
        write_mem();
        #20
        read_mem();
        comp();
     end 
   end

    task write_mem();
        begin
            wr_rd = 1;
            addr = $random;
            data_in = $random;
            addr_l = addr;
            temp[addr_l] = data_in;
            #10; // Provide time for write operation to complete
            $display("write packet :: en=%h, wr_rd=%h, addr=%h, data_in=%h", en, wr_rd, addr, data_in);
        end
    endtask

    task read_mem();
        begin
            wr_rd = 0;
            addr = addr_l;
            #10; // Wait for the read operation
            wait (out_en) begin
                data_out_l = data_out;
            end
            $display("read packet :: en=%h ,wr_rd=%h,addr=%h,data_out=%h", en, wr_rd, addr, data_out);
        end
    endtask

    task comp();
        begin
            if (temp[addr_l] == data_out_l) begin
                $display("mem is passed");
            end else begin
                $display("mem is failed");
            end
        end
    endtask

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(1);
        #500 $stop;
    end
endmodule
//////////////////////////////////////////////////
///////dual port ram ////////////////////////
module dual_port_ram(clk,cs,rd,wr,addr,data_in,data_out);
  input clk,cs,wr,rd;
  input [7:0] addr;
  input [63:0] data_in;
  output reg [63:0] data_out ;
  reg[7:0] i;
  
  reg [ 63:0] MEM [255 : 0] ;
  
  always@(posedge  clk) begin
    if(~cs) begin 
      data_out <= 'h0;
    end else begin
      if(wr) begin
        MEM[addr] <= data_in;
      end 
      
      if(rd) begin
        data_out <= MEM[addr];
      end 
    end 
  end
endmodule


module dual_port_ram_tb;
  reg clk,cs,wr,rd;
  reg [7:0] addr;
  reg [63:0] data_in;
  wire [63:0] data_out;
  
  //local vars
  reg[7:0] addr_l;
  
  dual_port_ram dut(.clk(clk),.cs(cs),.rd(rd),.wr(wr),.addr(addr),.data_in(data_in),.data_out(data_out));
  
  always #5 clk = ~clk;
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    $monitor("[%0t] clk=%h,cs=%h,wr=%h,rd=%h,addr=%h,data_in=%h,data_out=%h",$time,clk,cs,wr,rd,addr,data_in,data_out);
  end 
    
  initial begin
    clk=0; cs=0; wr=0; rd=0; #10;
    cs=1;
    repeat(20) begin
      write();
      read();
      #10;
    end 
  end 
  
  task write();
   begin
       wr=1; rd=0;
      addr= $random;
      data_in = $random ;
      addr_l = addr;
     #10;
    end
  endtask
  
  task read();
    begin
    wr=0; rd=1;
    addr = addr_l;
    end 
  endtask 
  
  initial #1000 $stop;
  
endmodule 


module dual_port_ram1(
  input [7:0] data_a, data_b,
  input [5:0] addr_a, addr_b,
  input clk,wr_a,wr_b,
  output reg [7:0] out_a, out_b);
  
  reg [7:0] MEM [61:0] ;
  
  always@(posedge clk) begin
    if(wr_a) begin
      MEM [addr_a] <= data_a;
    end else begin
      out_a <= MEM [addr_a] ;
    end
  end 
  
  always@(posedge clk) begin
    if(wr_b) begin
      MEM [addr_b] <= data_b;
    end else begin
      out_b <= MEM [addr_b];
    end 
  end 
  
endmodule

module test_dual_ram;
  reg [7:0] data_a, data_b;
  reg [5:0] addr_a, addr_b;
  reg clk = 0, wr_a = 0, wr_b = 0;
  wire [7:0] out_a, out_b;
  
  dual_port_ram1 dut (
    .clk(clk),
    .addr_a(addr_a),
    .addr_b(addr_b),
    .out_a(out_a),
    .out_b(out_b),
    .wr_a(wr_a),
    .wr_b(wr_b)
  );
  
  always #5 clk = ~clk;
  
  initial begin
    $dumpfile("ram.vcd");
    $dumpvars(1);
   $monitor("wr_a=%h, addr_a=%h, data_a=%h, out_a=%h",wr_a,addr_a,data_a, out_a);
  end 
  
  initial begin
    clk=0; wr_a = 1; wr_b = 1;
    addr_a = 5; addr_b = 7;
    data_a = $random; data_b = $random;
	
    #10;wr_a = 0; wr_b = 0; 
    
    #10; wr_a = 1; wr_b = 1;
    addr_a = 6; addr_b = 8;
    data_a = $random; data_b = $random;
	
    #10; wr_a = 0; wr_b = 0;
    
    #10; wr_a = 1; wr_b = 1;
    addr_a = 9; addr_b = 10;
    data_a = $random; data_b = $random;
	
    #10; wr_a = 0; wr_b = 0; 
    #10; $stop;
  end 
endmodule


