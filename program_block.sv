//=========================================
// interafce
//=========================================

interface my_inf;  
    bit data;
endinterface

//=========================================
// Design Block
//=========================================
module design_alu(a);
    input a;
endmodule

//=========================================
// program block
//=========================================

program test;
  
  bit clk ;
  logic [3:0] a;
   
  //module/UDP/interface/program instantiation is not allowed inside a program
  //my_inf inf_h();
  
   //The always construct is illegal in this context.
   // always #10 clk = ~clk ;
  
  initial
    begin
       $display("\"program\" simulation");
      #100 $finish();
    end  
endprogram

//=========================================
// class 
//=========================================
  
class my_class;
   
  function new();
      $display("\"class\" simulation");
    endfunction
endclass

//=========================================
// module 
//=========================================
module test_p;
  
  logic a_tb;
  
  //Testbench
  test t (.*);
  
  //Design 
  design_alu  DUT( .a(a_tb)); 

 initial
   begin
     $display("\"Module\" simulation");
      //  t.print;
     $dumpfile("dump.vcd"); 
     $dumpvars;
  end
endmodule
