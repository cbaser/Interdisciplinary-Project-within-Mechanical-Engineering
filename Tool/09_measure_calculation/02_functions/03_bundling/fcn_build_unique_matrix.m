function [ unique_matrix ] = fcn_build_unique_matrix( where,what,index )
%building unique matrix from specific value with column index
 [row,~] = find(strcmp(where(:,index),what));
        unique_matrix={};
        for m=1:size(row,1)
         unique_matrix = [ unique_matrix;where(row(m,1),:)];
        end
        
end

