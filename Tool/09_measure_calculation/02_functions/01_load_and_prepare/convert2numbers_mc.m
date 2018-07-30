function [ converted_arr ] = convert2numbers_mc(converted_arr,column,columnIdx,indexAttribute  )
%Convert incoming array's column into numbers by according glo_names_possibilities  
load('ws_global_attributes.mat','glo_names_possibilities');
   for i=1:size(column,1) 
    for j=1:glo_names_possibilities{indexAttribute,2}
       if(strcmp(column{i,1}, glo_names_possibilities{indexAttribute,1}{j}))
        converted_arr(i,columnIdx) =j;
       end
    end

   end
end

