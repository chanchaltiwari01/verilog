
// mealy finite state machine 

// desing a mealy sequence detecter for 10011 

module mealy(
  input clk,rst,in,
  output reg out);
    reg [1:0] state ;
  always @(posedge clk,posedge rst)
    begin
      $display("state=%B",state);
      if(rst)
        state <=0;
      else
        begin
          case(state)
            2'b00: begin
              out =0;
              state <= in ? 2'b01 : 2'b00;
            end
            
             2'b01: begin
              out =0;
              state <= in ? 2'b01 : 2'b10;
            end
            
             2'b10: begin
              out =0;
              state <= in ? 2'b11 : 2'b00;
            end
             2'b11: begin
              out = in ? 1'b1 : 1'b0 ;
              state <= in ? 2'b01 : 2'b10;
            end
            default : state <= 2'b00;
          endcase
        end 
    end
endmodule 

module test_mealy ;
  reg in,clk=1'b0,rst;
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
    rst=1; in=1; #10;
    rst=0; #10;
    in=0; #10;
    in=1; #10;
    in=1; #10;
    in=0; #10;
    in=1; #10;
    in=1; #20;
    $stop;
  end
endmodule 
