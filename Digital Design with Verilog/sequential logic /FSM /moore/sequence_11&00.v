// FSM (finite state mahine )
//                   |---- overlapping 
//                   |
// mealy and more ---
//	                |
//				    |---- non overlapping 


//design a moore state machine detect pair of zeros of pair of ones (00/11)

module moore_detector(
    input clk, reset, in,
    output reg out
);

    reg [1:0] state;

    always @(posedge clk) begin
        if (reset)
            state <= 2'b00;
        else 
          begin
            case (state)
                2'b00: begin
                    if (in)
                        state <= 2'b01;
                    else
                        state <= 2'b10;
                end
              2'b01: begin
                if(in)
                  state <= 2'b11;
                else 
                  state <= 2'b10;
                end 
              2'b10: begin
                if(in)
                  state <= 2'b01;
                else 
                  state <= 2'b11;
              end 
              2'b11: begin
                if(in)
                  state <= 2'b01;
                else 
                  state <= 2'b10;
              end 
              default : state <=2'b00;
            endcase
            end 
    end 
  
  // output 
  always@(posedge clk)
    begin
      
      if(state ==2'b11)
        out <= 1;
      else
        out <=0;
         end 
  //state 
  always @(posedge clk)
    begin
      $display("state=%b",state);
    end 
endmodule 
       

module test_moore;
   reg clk=1'b0,reset,in;
  wire out;
  
  moore_detector u0(.clk(clk),
                    .reset(reset),
                    .in(in),
                    .out(out));
  
  always #5 clk = ~clk;
  
  initial 
    begin
      $dumpfile("dump.vcd");
      $dumpvars(1);
      $monitor("clk=%b, reset=%b, in=%b, out=%b",clk,reset,in,out);
      reset=1; in=1; #10;
      reset=0; #20;
      in=0;
      #30;
      $stop;
    end 
endmodule 
