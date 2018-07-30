function [ ] = fcn_rebundling( vehicle,title,engine_design,engine_specification,engine_volume,finish_lane)
%That function basically repeat function of bundling
%But there is one difference
%If the same value matrix has same unique values with vehicle matrix
%All entries of same value matrix at that specific column will be 'null'
%Then same bundling process starts


load('ws_database_raw.mat');
load('ws_full_matrix.mat');
unique_components = fcn_find_uniques(full_matrix,title);


    for u=1:size(unique_components,1)
        load('ws_full_matrix.mat');
        [row,~] = find(strcmp(full_matrix(:,title),unique_components{u,1}));
        components = fcn_build_unique_matrix(full_matrix,unique_components{u,1},title);
        unique_variables= fcn_find_unique_values(components(:,4));
     
        for j=1:size(unique_variables,1)
   
            [row_1,~] = find(cell2mat(components(:,4))==unique_variables(j,1));

             same_value_matrix = {};
             for k=1:size(row_1,1)
             same_value_matrix = [ same_value_matrix;components(row_1(k,1),:)];
             end
             main_result=fcn_rebundling_sub_iteration(same_value_matrix,vehicle,finish_lane,engine_design,engine_specification,engine_volume);      
        end

         if(main_result)
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
end

























