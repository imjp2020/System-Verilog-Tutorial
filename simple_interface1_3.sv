//=============================================================
// Method #3 : Simple interface  clk  and intf connection 
//=============================================================

interface simple_bus(input bit clk);
   
  logic req,gnt ;
  logic [7:0] addr ,data ;
  logic [1:0]  mode ;
  logic start ,ready;  
  
  initial
    begin
      req=1'b1;
    end

endinterface 

module memmod (simple_bus a);  
  logic en_a =1'b1 ;
  always @(posedge a.clk)     
           a.gnt <=a.req && en_a ;
     
endmodule

module cpumod (simple_bus b);
  
  logic en_b =1'b1 ;
  
  always @(posedge b.clk)
         b.gnt <=b.req && en_b ;
   
endmodule


module top();
  
  logic clk=0 ;
  
  always #10 clk = ~clk ;
  
  // Only clk connected to intf1 and intf2 
  
  simple_bus sb_intf1(clk);  
  simple_bus sb_intf2(clk);  
  
  // Module and intf1 and intf2 connections
  
  memmod  u_mem (.a(sb_intf1));
  cpumod u_cpu  (.b(sb_intf2)) ;
  
  initial
    begin
    $dumpfile("dump.vcd");
      $dumpvars;
      #1000;
      $finish();
    end
endmodule
