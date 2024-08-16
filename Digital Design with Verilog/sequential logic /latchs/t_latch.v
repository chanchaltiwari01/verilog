
module t_latch(
   input en, t,
   output reg q=1'b0, q_bar
);

always @(en, t) begin 
    if (en) begin
        if (t)
            q <= ~q;
        else
            q <= q;
    end 
    else
        q <= q;
end

always @(q) begin
    q_bar <= ~q;
end

endmodule

module test_dlatch;
    reg en, t;
    wire q, q_bar;
  
    t_latch u0(.t(t), .en(en), .q(q), .q_bar(q_bar));

    initial begin
        $monitor("en=%b, t=%b, q=%b, q_bar=%b", en, t, q, q_bar);
        en = 0; t = 0; #1; 
        en = 1; #1;
        t = 1; #1;
        en = 0; #1;
        en = 1; t = 0; #1; 
        t = 1; #1;
        t = 0; #1;
      t = 1;
    end 
endmodule
