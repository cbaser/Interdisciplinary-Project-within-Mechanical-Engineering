function [ out ] = fcn_compare_numbers( ind1,ind2 )
%checks incoming row index numbers (For example 1 and 7)
load('ws_database_converted.mat');
load('ws_compared_indexes');
row1 = indexes(ind1,1);
row2 = indexes(ind2,2);
out=1;
  for col=1:size(converted_arr,2) 
  %Starts from first column to last column
      if(converted_arr(row1,col) ~= converted_arr(row2,col))
          %If they are not equal and not null it can not be combined
              if(converted_arr(row1,col) ~=0 && converted_arr(row2,col)~=0)  
                  %can not be combined is sent by boolean function as 0
                  out = 0;
                  break;
              end
      
      end

  end

end

