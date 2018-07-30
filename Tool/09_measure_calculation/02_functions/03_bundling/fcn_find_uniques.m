 function [matrix] = fcn_find_uniques(where,index)
 %find unique string values in specific column
    matrix ={};
    for i=1:size(where,1)
        matrix{i,1} = where{i,index};
    end    
    matrix = unique(matrix);
    end
