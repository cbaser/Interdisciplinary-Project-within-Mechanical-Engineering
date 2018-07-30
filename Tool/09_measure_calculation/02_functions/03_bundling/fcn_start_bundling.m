function [ ] = fcn_start_bundling(  )
%That function is responsible for bundling process
%First we need to get column indexes for future use if some columns will be
%added or removed.

load('ws_global_attributes.mat','glo_names_all');
[finish_lane,~] = find(strcmp(glo_names_all(:,2),'Max. Anforderungen'));
[vehicle,~] = find(strcmp(glo_names_all(:,2),'Derivat'));
[title,~] = find(strcmp(glo_names_all(:,2),'Bezeichnung'));
[engine_design,~] =  find(strcmp(glo_names_all(:,2),'Motor-Bauform'));
[engine_specification,~] = find(strcmp(glo_names_all(:,2),'Motor-Spezifikation'));
[engine_volume,~] = find(strcmp(glo_names_all(:,2),'Motor-Hubraum'));
[engine_power,~] = find(strcmp(glo_names_all(:,2),'Motorleistung'));
[engine_torque,~] = find(strcmp(glo_names_all(:,2),'Motordrehmoment'));


%Loading the raw matrix
load('ws_full_matrix.mat');
%Loading the database
load('ws_database_raw.mat');
%Finding the unique components from full matrix
unique_components = fcn_find_uniques(full_matrix,title);


for u=1:size(unique_components,1)
    load('ws_full_matrix.mat');
    %finding the location of components
    [row,~] = find(strcmp(full_matrix(:,3),unique_components{u,1}));
    
    %Building specific component matrix with all same components
    components = fcn_build_unique_matrix(full_matrix,unique_components{u,1},title);
    %Finding different unique values from same component
    unique_values= fcn_find_unique_values(components(:,4));
    for j=1:size(unique_values,1)
        
        [row_1,~] = find(cell2mat(components(:,4))==unique_values(j,1));
        
         same_value_matrix = {};
         %constructing same value matrix
         for k=1:size(row_1,1)
            same_value_matrix = [ same_value_matrix;components(row_1(k,1),:)];
         end
           %sending same value matrix into bundling process
         main_result=fcn_check_columns(same_value_matrix,finish_lane,vehicle,engine_design,engine_specification,engine_volume,engine_power,engine_torque);      
    
      
      
     end
        %if it is bundled, main result is 1
     if(main_result)
         %delete full matrix found row values
            fcn_delete_rows(row);
     else
             if(exist('ws_can_be_bundled.mat','file')==2)
                            load('ws_can_be_bundled.mat');
                            if(canBeBundled)
                                fcn_delete_rows(row);
                                fcn_jump_to_path('fcn_check_columns');
                                delete('ws_can_be_bundled.mat');
                            end
             end
     end
        
        
end
    
    
    

fcn_check_same_attributes_without_motor(engine_power,engine_torque,finish_lane);
fcn_rebundling(vehicle,title,engine_design,engine_specification,engine_volume,finish_lane);
end



