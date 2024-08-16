
module mealy(
  input clk,in,rst,
  output reg out);
  reg ps,ns;
  parameter s0=1'b0, s1=1'b1;
  
  always@(posedge clk, posedge rst)
    begin
       $display("state=%b",ps);
      if(rst)
        ps <= s0;
      else 
        ps <= ns;
    end 
  always@(ps,in)
    begin
       case(ps)
        s0: begin 
          if(in) begin
            out <=1; 
            ns <= s1;
          end 
          else 
            begin
              out <= 0;
              ns <= s0;
            end 
        end
        s1: begin
          if(in) begin
            out <= 0;
            ns <= s0;
          end 
          else begin
            out <= 1;
            ns <= s1;
          end 
        end
        default : ps <=s0;
      endcase
    end 
endmodule 

module test_mealy;
  reg clk=1'b0,rst,in;
  wire out;
  
  mealy u0(.clk(clk),
           .rst(rst),
           .in(in),
           .out(out));
  
  always #5 clk = ~clk;
  initial begin
    $monitor("clk=%b,rst=%b,in=%b,out=%b",clk,rst,in,out);
    $dumpfile("mealy.vcd");
    $dumpvars(1);
    rst=1; in=0; #10; 
    rst=0; #10;
    in=1; #10;
    in=0; #10;
    in=1; #10;
    in=0; #10;
  $stop;
  end 
endmodule 
