function [ value_matrix ] = fcn_get_valueAttributes( value )
load('ws_global_attributes.mat', 'glo_names_possibilities','glo_names_all');
glo_names_all = glo_names_all(1:52,:);
[r,~] = find(strcmp(glo_names_all,value));
value_matrix = glo_names_possibilities(r-10,1);
value_matrix =[value_matrix{:}];
