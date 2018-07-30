function [  ] = fcn_check_motor_attributes( row )
load('ws_full_matrix.mat')
if(size(row,1)==1)
    return;
end


for i=1:size(row,1)
    for j=i+1:size(row,1)
        if (strcmp(full_matrix{row(i,1),13},full_matrix{row(j,1),13}) && ...
            strcmp(full_matrix{row(i,1),15},full_matrix{row(j,1),15}) && ...
            strcmp(full_matrix{row(i,1),16},full_matrix{row(j,1),16}) && ...
            strcmp(full_matrix{row(i,1),17},full_matrix{row(j,1),17}) && ...
            strcmp(full_matrix{row(i,1),18},full_matrix{row(j,1),18}))   
            
            full_matrix{row(i,1),19}='null';
            full_matrix{row(j,1),19}='null';
            full_matrix{row(i,1),21}='null';
            full_matrix{row(j,1),21}='null';
             fcn_jump_to_path('fcn_start_calculation');
             delete('ws_full_matrix.mat');
             var_filename = 'ws_full_matrix.mat';
             save(var_filename, 'full_matrix');
         
        end

    end
end

    
   


end

