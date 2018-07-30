function [  ] = fcn_add_coordinates( input_cell )

if(exist('ws_missing_coordinates.mat','file')==2)
    load('ws_missing_coordinates.mat');
    missing_matrix = [missing_matrix ; input_cell];

else
    missing_matrix={};
     missing_matrix = [missing_matrix ; input_cell];
end

fcn_jump_to_path('fcn_add_coordinates');
 
var_filename = 'ws_missing_coordinates.mat';
save(var_filename, 'missing_matrix');

end

