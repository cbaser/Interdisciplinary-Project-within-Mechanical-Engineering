function [  ] = fcn_prepare_for_saving()
%After the bundling some id numbers can be same or not be ordered
%SQLite gives an error if id numbers are same (because of primary key
%constraint)
%Thats why this function resets the maﬂ id numbers and saved them
load('ws_full_matrix.mat');
first_id = full_matrix{1,1};
for i=1:size(full_matrix,1)
first_id = first_id +1;
full_matrix{i,1} = first_id;
full_matrix{i,4} = round(full_matrix{i,4},2);
end
fcn_jump_to_path('fcn_start_calculation');
 delete('ws_full_matrix.mat');
 var_filename = 'ws_full_matrix.mat';
 save(var_filename, 'full_matrix');
end