function [ variables ] = fcn_find_unique_values( input_matrix )
%find unique real values (not string ones)
variables = unique(cell2mat(input_matrix));
end