function [  ] = fcn_add_new_coordinate( attribute_type )
%adding new coordinate into missing coorinate matrix
fcn_jump_to_path('fcn_add_new_coordinate');
load('ws_global_attributes.mat');   

attribute_name = strcat('ws_',attribute_type,'_attributes.mat');
value_name = strcat('ws_',attribute_type,'_values.mat');

%that function allows adding new coordinate by concatenate
%attributes and name of missing coordinate



load(value_name);
load(attribute_name);
         input_cell = [value_matrix,attributes_matrix'];    
         empty_cell = cell(1,size(glo_names_all,1)-size(input_cell,2));
         empty_cell(1,:) = {'null'};
         input_cell = [input_cell,empty_cell];
         
        if(exist('ws_missing_coordinates.mat','file')==2)
        load('ws_missing_coordinates.mat');
        max_id = max([missing_matrix{:,1}]);
        max_id = max_id +1;
        input_cell{1,1}=max_id;
        missing_matrix = [missing_matrix ; input_cell];   
        else
        missing_matrix={};
        input_cell{1,1}=1;
        missing_matrix = [missing_matrix ; input_cell];    
        end   
        delete(value_name);
        delete(attribute_name);
        var_filename = 'ws_missing_coordinates.mat';
        save(var_filename, 'missing_matrix');
