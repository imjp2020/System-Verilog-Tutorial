//---------------------------------------------------
// Paramterized interface example
//---------------------------------------------------

interface simple_bus#(ADDR_WIDTH=8 ,DATA_WIDTH=16) (input bit clk);
 
  logic 		req,gnt ;
  logic			start,rdy;
  logic [1:0] 	mode ;
  logic [ADDR_WIDTH-1:0]  addr;
  logic [DATA_WIDTH-1:0]  data;
  
endinterface 

//----------------------------------------------------
//   memory module use wide inteface 
//----------------------------------------------------
module memmod(interface a);
 
  logic mem_en; 
  
endmodule

//----------------------------------------------------
//   cpu module use simple_bus  interface 
//----------------------------------------------------
  
  module cpumod(interface b);
  
  logic cpu_en; 
  
endmodule  

    
//------------------------------------------
//    top module    
//------------------------------------------
module top;
 
  logic clk=0; 
  always #10 clk = ~clk ;
  
  simple_bus  sb_intf(clk);
  simple_bus  #((32),(64)) wide_intf(clk) ;
  
  memmod   u_mem(wide_intf);
  cpumod  u_cpu(sb_intf);
  
    initial 
      begin
       $dumpfile("dump.vcd");
       $dumpvars();
       #500;
       $finish();
    end
endmodule  
