
function [  ] = fcn_check_columns_old( row )
if(size(row,1)==1)
    return;
end
load('ws_full_matrix.mat');
load('ws_global_attributes.mat','glo_names_all');
columns_matrix = {};
for i=1:size(row,1)
    columns_matrix = [columns_matrix;full_matrix(row(i,1),:)];
end


load('ws_global_attributes.mat','glo_names_all');
[finish_lane,~] = find(strcmp(glo_names_all(:,2),'Max. Anforderungen'));
a_new_measure= cell(1,size(columns_matrix,2));
a_new_measure(1,1:10) = columns_matrix(end,1:10);
a_new_measure(1,finish_lane:end)= columns_matrix(end,finish_lane:end);

can_be_bundled=0;
uniques_of_components = find_uniques(columns_matrix,3);
for u=1:size(uniques_of_components,1)
[unique_component_row,~] = find(strcmp(columns_matrix(:,3),uniques_of_components{u,1}));
             divided_matrix={};
              for uc=1:size(unique_component_row,1)
                divided_matrix = [divided_matrix;columns_matrix(unique_component_row(uc,1),:)];
              end
             a_new_measure= attributes_iteration(divided_matrix,finish_lane,row,a_new_measure);
             if(check_bundling(a_new_measure))
                 can_be_bundled=1;
                add_measure_to_database(full_matrix,a_new_measure);
             end

end
if(can_be_bundled)
         load('ws_full_matrix.mat');
        fcn_jump_to_path('fcn_start_calculation');
        full_matrix(row,:)=[];
        delete('ws_full_matrix.mat');
        var_filename_full_matrix = 'ws_full_matrix.mat';
        save(var_filename_full_matrix, 'full_matrix');
else
     if(exist('ws_can_be_bundled.mat','file')==2)
                            load('ws_can_be_bundled.mat');
                            if(canBeBundled)
                                load('ws_full_matrix.mat');
                                fcn_jump_to_path('fcn_start_calculation');
                                full_matrix(row,:)=[];
                                delete('ws_full_matrix.mat');
                                var_filename_full_matrix = 'ws_full_matrix.mat';
                                save(var_filename_full_matrix, 'full_matrix');
                                fcn_jump_to_path('fcn_check_columns');
                                delete('ws_can_be_bundled.mat');
                                delete('ws_new_measure.mat');
                            end
     end
end
    
end
function [ ] = add_measure_to_database(full_matrix,a_new_measure)             
                        full_matrix = [full_matrix;a_new_measure];
                        fcn_jump_to_path('fcn_start_calculation');
                        delete('ws_full_matrix.mat');
                        var_filename = 'ws_full_matrix.mat';
                        save(var_filename, 'full_matrix');                            
    end
 
    function [first_Bundling] = check_bundling(a_new_measure)
          first_Bundling=1;
                    for m=1:size(a_new_measure,2)
                        if(isempty(a_new_measure{1,m}))
                            first_Bundling=0;
                            break;
                        end
                    end               
    end
    
function [engine_matrix] = build_engine_matrix(engine_type)
 load('ws_database_raw.mat');
 
 engine_matrix = {};
 [row_1,~] = find(strcmp(database_raw(:,16),engine_type));
 for j=1:size(row_1,1)
            engine_matrix = [engine_matrix;database_raw(row_1(j,1),:)];
 end 
end
 

    
    function [ a_new_measure ] = attributes_iteration( columns_matrix,finish_lane,row,a_new_measure ) 
    uniques_of_engines = find_uniques(columns_matrix,16);
    for u=1:size(uniques_of_engines,1)
    [unique_engines_row,~] = find(strcmp(columns_matrix(:,16),uniques_of_engines{u,1}));
             divided_matrix={};
              for uc=1:size(unique_engines_row,1)
                divided_matrix = [divided_matrix;columns_matrix(unique_engines_row(uc,1),:)];
              end
                engine_matrix = build_engine_matrix(uniques_of_engines{u,1});

         for j=11:finish_lane
                            tmp_divided_matrix = unique(divided_matrix(:,j));
                            %Step 4
                            if(size(tmp_divided_matrix)==1)
                                a_new_measure{1,j} = tmp_divided_matrix{1,1};
                            else
                                %Step 5
                                tmp_engine_matrix = unique(engine_matrix(:,j));
                                if(isequal(tmp_divided_matrix,tmp_engine_matrix))
                                    a_new_measure{1,j} = 'null';
                                else
                                    for k=1:size(tmp_engine_matrix,1)
                                        if(strcmp(tmp_engine_matrix{k,1},'null'))
                                            tmp_engine_matrix(k,:)=[];
                                        end
                                    end
                                        if(isequal(tmp_divided_matrix,tmp_engine_matrix))
                                            a_new_measure{1,j} = 'null';
                                        else
                                            fcn_jump_to_path('fcn_check_columns');
                                            var_filename_measure = 'ws_new_measure.mat';
                                            save(var_filename_measure, 'a_new_measure');
                                            fcn_column_iterations(columns_matrix,engine_matrix,j,row,finish_lane);
                                            a_new_measure = cell(1,size(columns_matrix,2));
                                            break;
                                        end
                                end
                            end   
            end 
         
         
         
         
         
         
       end  
         
            
    end
    
    
    function [matrix] = find_uniques(where,index)
    matrix ={};
    for i=1:size(where,1)
        matrix{i,1} = where{i,index};
    end    
    matrix = unique(matrix);
    end
    
    
    
   


