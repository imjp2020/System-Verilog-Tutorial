//------------------------------------------------------------------------
//  randomize-constaint using " if_else" implication/ conditional operator 
//-------------------------------------------------------------------------

class item;

  rand  enum { LOW ,HIGH ,MID } mode ;
  rand  bit[4:0] val ;
  
  /*constraint c_1 { if(mode==LOW) val < 10 ;                  
                     else if  (mode==MID)  {val >= 10 ; val <=20 ;}  
                     else val > 20; 
                    }                 
 */
  
 constraint c_1    { val ==((mode==LOW) ? 10 :150) ;}
//constraint c1_0  { solve mode before val ;    mode == ((val ) ? MID :LOW) ;}             
//constraint c1_1  { solve val before mode ;} 
//constraint c2_0  { solve mode before val ;} 
//constraint c2_1  { (mode ==LOW) -> val < 30  ;} 
  
function void print();
   $display("mode=%s val=%d",mode.name(),val);
endfunction 
  
endclass

module test;
  
  initial 
   repeat(20)  
     begin
      item t;
      t=new();
      t.randomize();
      t.print();
    end
endmodule
