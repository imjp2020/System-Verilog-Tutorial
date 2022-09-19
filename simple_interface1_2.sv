//=====================================================================
// Simple interaface 1.2 Method 1 pass intf Handle to module-Name and clk 
//=====================================================================

interface simple_bus;
  
  logic req,gnt ;
  logic [7:0] addr ,data ;
  logic [1:0]  mode ;
  logic start ,ready;  
  
  initial
     begin
      req=1'b1;
     end
endinterface 

//module memmod (simple_bus a,input clk);
module memmod (interface  a,input clk);

  logic en_a =1'b1 ;
  
   //always @(posedge clk)
       //a.gnt <=a.req && en_a ;
     
endmodule


//module cpumod (simple_bus b,input clk);
module cpumod (interface  b,input clk);  
  
  logic en_b =1'b1 ;
  
  // always @(posedge clk)  
      //b.gnt <=b.req && en_b ;
     
endmodule


module tb_top();
  
  logic clk=0 ;
  
  always #10 clk = ~clk ;
  
  simple_bus sb_intf();  
  
  memmod  u_mem (.a(sb_intf) ,.clk(clk));
  cpumod  u_cpu (.b(sb_intf) ,.clk(clk));
  
  
  initial
    begin
    $dumpfile("dump.vcd");
      $dumpvars;
      #1000;
      $finish();
    end
endmodule
