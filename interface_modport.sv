//============================================================================
//  pass intf handle  to module-name and clk signals 
//  Given slave and master modport drive signals 
//    mem is slave
//    cpu is master 
//    Method -2 use modport  while instantation of mem and cpu at TOP 
//============================================================================  

interface simple_bus(input bit clk);
  
  logic req,gnt ;
  logic [7:0] addr ;
  logic [7:0] data ;
  logic [1:0]  mode ;
  logic start ,rdy;  
  
  //modport definations
  modport  slave (input req,addr,mode ,start,clk,
                 output gnt,rdy ,data
                      ); 
  
  modport  master (input gnt ,rdy,clk,data ,
                 output req,addr,mode ,start
                 );  
  
  initial
    begin
      req=1'b1;
    end
endinterface  

/*********************************Memory module**********************************/

//module memmod (simple_bus a);
module   memmod (interface    a);  
  logic en_a =1'b1 ;
  
  always @(posedge a.clk) begin
     
            //w.r.t to SLAVE modport only output can be driven
            a.gnt <=a.req && en_a ;
   			a.rdy <=1'b1;
            a.data <=32'hAADD;
  end
  
   //modport definations
   //modport  slave (input req,addr,mode ,start,clk,data,
   //              output gnt,rdy
   //                   ); 
endmodule

/*************************CPU Module ********************************************/
//module cpumod (simple_bus  b);
module cpumod (interface b);  
  logic en_b =1'b1 ;
  
    //modport  master (input gnt ,rdy,clk,
    //             output req,addr,mode ,start ,data
    //             );  
  
  always @(posedge b.clk) begin
        b.req <=b.gnt && en_b ;
        b.addr<=32'hFF;
       end
     
endmodule

module top();
  
  logic clk=0 ;
  
  always #10 clk = !clk ;
  
  
  simple_bus 			sb_intf(clk);  
  memmod               u_mem        (sb_intf.slave);
  cpumod               u_cpu        (sb_intf.master );
  
  
  initial
    begin
    $dumpfile("dump.vcd");
      $dumpvars;
      #1000;
      $finish();
    end
endmodule
