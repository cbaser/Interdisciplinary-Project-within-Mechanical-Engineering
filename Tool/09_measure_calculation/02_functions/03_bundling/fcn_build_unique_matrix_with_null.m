function [ unique_matrix ] = fcn_build_unique_matrix_with_null( where,what,index )
%building specific unique matrix also with null values
first_matrix = {};
[row,~] = find(strcmp(where(:,index),'null'));
for m=1:size(row,1)
         first_matrix = [ first_matrix;where(row(m,1),:)];
end

[row,~] = find(strcmp(where(:,index),what));
        unique_matrix={};
        for m=1:size(row,1)
         unique_matrix = [ unique_matrix;where(row(m,1),:)];
        end
        unique_matrix = [unique_matrix;first_matrix];


end

