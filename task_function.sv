//===========================================================================
// Simple task and function 
//===========================================================================

module this_task_func;
  
  int a,b,c;
  
  // Error in below function prototype 
  //function void my_task(aa,bb,cc);  
  //--> No direction specified for args SUM will be wrong 
  
  //Input ,output and inout args needs to be specified for SUM
  //function void my_task(int aa,int bb,int cc); -try this 
  function void my_task(input int aa,bb,output int cc);
     a=aa;
     b=bb;
     c=a+b;
     cc=c;
    $display("a=%0d b=%0d c=%0d",aa,bb,c);
    
  endfunction
  
  
  initial
    begin
      int x;
      my_task(1,4,x);
      my_task(2,4,x);
      my_task(3,4,x);
      $display("**d**=%0d",x);
    end
  
  
/*
  task automatic my_task(input int aa,bb,output int cc);
     a=aa;
     b=bb;
     c=a+b;
     cc=c;
    $display("a=%0d b=%0d c=%0d",aa,bb,c);
    
  endtask
  
  initial
    begin
      int x;
      my_task(1,4,x);
      my_task(2,4,x);
      my_task(3,4,x);
      $display("**d**=%0d",x);
    end*/
endmodule
