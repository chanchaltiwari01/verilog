
module jk_latch(
     input j,k, en,
	 output reg q,q_bar);
	 
  always@(j,k,en)
   begin
    if(en)
      begin
        if(!j && !k)
		q<=q;
        else if(!j && k)
		q<=1'b0;
        else if (j && !k)
		q<= 1'b1;
        else if (j && k)
		q <= ~q;
		else 
		q<=q;
	  end 
	 else 
	 q <= q;
	end
	always@(q) 
	begin
	q_bar <=~q;
	end 
endmodule 


module test_jklatch;
  reg j,k,en;
  wire q,q_bar;
  
  jk_latch u0(.j(j),.k(k),.en(en),.q(q),.q_bar(q_bar));
  initial begin
      $monitor("en=%B, j=%b, k=%b, q=%b, q_bar=%b",en,j,k,q,q_bar);
    en=0; j=0;k=0; #1;
    en=1; #1;
    j=0;k=0; #1;
    j=0; k=1; #1;
    j=1; k=0; #1;
    j=1; k=1; #1;
    j=0; k=1; #1;
    j=1; k=1; #1;
    en=0; j=0; #1;
    en=1; #1;
    k=0;
  end 
endmodule 
