function [  ] = fcn_build_combination_matrix(missingCoordinate )
%checks that whether incoming attributes are coming from missing coordinate
%or not
%Function basically combines all combination values and change the
%component name after all 
switch missingCoordinate
    case 0
            load('ws_component.mat');
            if(exist('ws_full_matrix.mat','file')~=2)
                full_matrix={};
                combination_matrix = fcn_get_combination_values();
                combination_matrix(:,3) = component_cell{1,1};
                full_matrix = combination_matrix;
            else
                load('ws_full_matrix.mat');
                combination_matrix = fcn_get_combination_values();
                combination_matrix(:,3)= component_cell{1,1};
                full_matrix=[full_matrix ; combination_matrix]; 
            end 
            
             fcn_jump_to_path('fcn_build_combination_matrix');
             var_filename = 'ws_full_matrix.mat';
            save(var_filename, 'full_matrix');
            
    case 1
        %Missing Coordinates
        load('ws_component.mat');
            if(exist('ws_full_matrix.mat','file')~=2)
                full_matrix={};
                combination_matrix = fcn_get_coordinate_values();
                combination_matrix(:,3) = component_cell{1,1};
                full_matrix = combination_matrix;              
            else
                load('ws_full_matrix.mat');
                combination_matrix = fcn_get_coordinate_values();
                combination_matrix(:,3)= component_cell{1,1};
                full_matrix=[full_matrix ; combination_matrix];            
            end
                   
            fcn_jump_to_path('fcn_build_combination_matrix');
             var_filename = 'ws_full_matrix.mat';
            save(var_filename, 'full_matrix');

end
%remove all unnecessary variables
fcn_remove_variables();

end

             