//=========================================================================
//   Array Manipulation Methods
//=========================================================================

module array_test;
    
  int array[13]='{11,3,7,2,5,9,6,1,35,6,11,9,4};
  int q[$];
 
  initial
    begin
      
      q=array.find(x) with (x==9 ); //user operators < > ,<= >= etc
      $display("array find() =%p",q);
      
      q=array.find_index(x) with (x==4 );
      $display("array find_index()=%p",q);
      
      q=array.find_first(x) with (x==11 );
      $display("array find_first()=%p",q);
      
      
      q=array.find_first_index(x) with (x==11 );
      $display("array find_first_index()=%p",q);
      
      q=array.find_last_index(x) with (x==11 );
      $display("array find_last_index()=%p",q);
           
      q=array.min();
      $display("array min()=%p",q);
                 
      q=array.max();
      $display("array max()=%p",q);
      
      $display("repeated data size of q=%0d",q.size());                 
      q=array.unique();
      $display("array unique()=%p",q);
      $display("unique size of q=%0d",q.size());
      
      $display("Original array=%p",array);                       
      array.reverse();
      $display("array reverse()=%p",array);
      array.sort();
      $display("array sort()=%p",array);
      array.rsort();
      $display("array sort()=%p",array);
      array.shuffle();
      $display("array shuffle()=%p",array);
      
    end
endmodule
