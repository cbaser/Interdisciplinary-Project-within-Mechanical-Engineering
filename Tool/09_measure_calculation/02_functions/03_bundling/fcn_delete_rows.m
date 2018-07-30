function [  ] = fcn_delete_rows( row )

load('ws_full_matrix.mat');
fcn_jump_to_path('fcn_start_calculation');
full_matrix(row,:)=[];
delete('ws_full_matrix.mat');
var_filename_full_matrix = 'ws_full_matrix.mat';
save(var_filename_full_matrix, 'full_matrix');


end

