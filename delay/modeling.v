/// modeling delay /////
 
 /// distributed delay ////
 module dis_delays(a,b,c,d,y);
 input a,b,c,d;
 output y;
 wire p,q;
 and #4 u1(p,a,b);
 and #5 u2(q,c,d);
 or #6 o1(y,p,q);
 endmodule 
 
 ///// lamped delay ////
 module lam_delay(y,a,b,c,d);
 input a,b,c,d;
 output y;
 wire p,q;
 and u0(p,a,b);
 and u1(q,c,d);
 or #10 o1(y,p,q);// output delay it is a maximaum delay in circuit 
 endmodule 
 
 /*///  pin to pin delay are assign indiaviually to put of each input to  output 
 
 path a-p-y; delay =9;
 path d-q-y; delay =11;*/
 
 /// parallel connection /////
 module parallel (a,b,,c,d,y);
 input a,b,c,d;
 output  y;
 wire e ,f ;
 and u1(e,a,b);
 and u2(f,c,d);
 or o1(y,e,f);
 specify 
 (a=>y)=9;
 (b=>y)=9;
 (c=>y)=11;
 (d=>y)=11;
 endspecify 
 endmodule 
 
 
 ///  full connection 
 
 module full (y,a,z,b)
 input[1:0]  a,b;
  output y;
 output [1:0] z;
 always @*
 begin 
 z=a^b;
 y=a&b;
 end 
 specify
 (a.b*>z)=7;
  (a.b*>y)=8;
 endspecify
 endmodule
