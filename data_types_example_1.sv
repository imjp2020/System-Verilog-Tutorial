//===================================================================================
//    Data types assigned with maxumum values and overflow it
//===================================================================================

module sv_data_types;
    
     // all int's default signed in nature 
     //make unsigned ,+1 then roll over  00000
     int       unsigned           int_a='1;  		//0000
     shortint  unsigned       short_int_a='1;  		//0000
     longint   unsigned       long_int_a='1;  		//0000
     integer   unsigned      integer_a='1; 		    //zzz
    
     reg[3:0]       reg_a1;               // xxx
     reg            reg_one_bit;          // xxx
     logic[3:0]     logic_a;              //xxx
     logic          logic_one_bit;        //xxx
     string         string_a="";          //NA
     string          new_hier=" ";
     bit[3:0]       bit_a;                  //0000
     bit            bit_one;               //0000
     byte unsigned   	byte_a;             //000
  	 real        	real_a=1.234567890;     //0.000
  	 time        	time_a=1.22;            //xxx
     realtime     	real_time=9.9;        //0.000
     event          even_e1;
      
  
    function string name(input string n);
      foreach(n[i]) begin
        name=n;
         end
    endfunction
  
    initial
    begin
   
      string_a=name(" core_tb.dut.ip;");  
      
         
      foreach(string_a[i,j]) begin
        new_hier=string_a.substr(i,j);
        
            //new_hier.len();                   
            $display("string_a=%s  new_hier=%s ",string_a,new_hier);
      end
      
       
     
      integer_a=32'h7FFF_FFFF;
      $display(" integer_a= %d",integer_a); 
      integer_a+=1;
      $display(" integer_a= %d",integer_a); 
      
      int_a=32'h7FFF_FFFF;
      $display(" int_a= %d",int_a);  
      int_a+=1;
      $display(" int_a= %d",int_a); 
      
      short_int_a=16'h7FFF;;
      $display(" shortint_a= %d",short_int_a); 
      short_int_a+=1;
      $display(" short_int_a= %d",short_int_a); 
      
      long_int_a=64'h7FFF_FFFF_FFFF_FFFF;
      $display(" longint_a= %d",long_int_a);  
      long_int_a+=1;
      $display(" longint_a= %d",long_int_a);  
            
            
      byte_a=8'hFF;
      $display(" byte_a= %h",byte_a);  
      byte_a=8'h64;
      $display(" byte_a= %h",byte_a);   
          
      
      $dumpfile("dump.vcd");
      $dumpvars;
      #1000;
      $finish();
    end
endmodule
