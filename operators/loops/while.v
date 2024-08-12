module while_loops;
  integer count;

  initial begin
    count = 0;
    while (count < 128) begin
      $display("count=%d", count);
      count = count + 1;
      #10; 
    end
  end
endmodule
