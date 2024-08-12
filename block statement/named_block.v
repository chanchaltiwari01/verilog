module namedblocks ;
  integer count=0,a=0,b=0;
  initial 
    begin:block1
      b=2;
      forever begin
        #2 count=count+1;
      end 
    end
  
  initial begin
    a=3;
    #5 a=9;
    #4 b=4;
    #4 a=6;
    #2 disable block1;
    #2 a=7;
  end
  
  initial begin 
    $monitor("[%0t]: count=%0d, a=%0d, b=%0d",$time,count,a,b);
  end 
endmodule  
