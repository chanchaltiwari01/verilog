// 101 sequence detector usin moore 

module moore (
    input clk,rst,in,
  output reg out);
  reg [1:0] state;
  
  always@(posedge clk)
    begin
      if(rst)
      state <= 2'b00;
      else
        begin
          case(state)
        2'b00: begin
              if(in)
                state <= 2'b00;
              else 
                state <= 2'b01;
            end 
        2'b01: begin
              if(in)
                state <= 2'b01;
              else 
                state <= 2'b10;
            end 
        2'b10: begin
              if(in)
                state <= 2'b11;
              else 
                state <= 2'b00;
            end 
        2'b11: begin
              if(in)
                state <= 2'b01;
              else 
                state <= 2'b10;
            end 
            default : state <= 2'b00;
          endcase 
        end
      end
            always@(posedge clk)
              begin
                if(state==2'b11)
                  out <= 1'b1;
                else 
                  out <= 1'b0;
              $display("state=%b",state);
              end 
endmodule

module test_moor;
  reg in,clk=1'b0,rst;
  wire out ;
  
  moore u0(.clk(clk),
           .in(in),
           .rst(rst),
           .out(out));
  always #5 clk = ~clk;
  
  initial 
    begin
      $dumpfile("moore.vcd");
              $dumpvars(1);
              $monitor("clk=%b,rst=%b,in=%b,out=%b",clk,rst,in,out);
              rst=1; in=1; #10;
              rst=0; in=0; #10;
              in=0; #10;
              in=1; #20;
              $stop;
        end
endmodule
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////  moore/////////////////////////////////////////////////////////////////////
module moore(
     input clk,rst,in,
  output reg out);
  reg state, next_state;
  
  parameter s0=1'b0,s1=1'b1; // state encoding 
  
  always@(posedge clk,posedge rst)
    begin
      if(rst)
         state <=1'b0;
      else 
       state <= next_state ;
    end 
      always@(state ,in)
        begin
          $display("state=%b",state);
          case(state)
            s0: begin
              out=0;
              if(in)
                next_state <= s1;
              else
                next_state <= s0;
            end
            s1: begin
              out =1;
              if(in)
                next_state <= s0;
              else 
                next_state  <=s1;
            end 
            default : next_state <= s0;
          endcase
        end
endmodule 
      
      
module test_moore ;
   reg in,clk=1'b0,rst;
   wire out ;
  
  moore u0(.in(in),
           .clk(clk),
           .rst(rst),
           .out(out));
  always #5 clk = ~clk;
  initial 
    begin
       $dumpfile("dump.vcd");
      $dumpvars(1);
      $monitor("clk=%b,rst=%b,in=%b,out=%b",clk,rst,in,out);
      rst=1;in=0; 
      #10 rst=0; in=0;
      #10 in=1;
      #10 in=0;
      #10 in=1;
      #10  $stop;
    end
endmodule 
