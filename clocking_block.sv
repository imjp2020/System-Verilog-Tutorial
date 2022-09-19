//===========================================================
//  Simple clocking block exmaple to sample and drive signals
//  All cb- drive with 
//===========================================================

interface a_if(input bit clk);
   
  logic req;
  logic clk ,gnt;  
  
  clocking cb1@(posedge clk);
     //input          gnt;
     input #1    gnt;
     output#50 req;
  endclocking
  
  clocking cb2@(posedge clk);
     //input          gnt;
     input #2    gnt;
     output#150 req;
  endclocking
  
  clocking cb3@(posedge clk);
     //input          gnt;
     input #0    gnt;
     output#250 req;
  endclocking
  
endinterface 
