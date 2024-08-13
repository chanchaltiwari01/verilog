///// gate delay use in gate level modeling/////////
module gate_delay(a,b,c,out);
input a,b,c;
output out ;
wire e ;
and #5 a1(e,a,b);// all delay assign  rise ,fall, turnoff delay 
or #4 o1(out,e,c);
endmodule 

// assign indiaviual all delay in gate 

module dalay(a,b,c,out);
input a,b,c;
output out ;
wire e;
and #(2,3,4) a1(e,a,b);/// (rise ,fall ,turn off )
or #(2,3)  o1(out ,e,c);/// (riss , fall) // rise =2, fall=3, turn off =3
endmodule 

module minmax(a,c,b);
input a,b;
output c; 
and #(2:3:4; 5:4:3; 4:5:6)a1(c,a,b);///// (minimam:tipycal:maximam )(rise; fall; turnoff)
endmodule 
