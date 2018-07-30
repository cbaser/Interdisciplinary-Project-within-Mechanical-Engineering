function [  ] = fcn_column_iterations( same_value_matrix,basis_matrix,columnIdx,finish_lane )

 load('ws_new_measure.mat');
 uniques_of_specific_column = fcn_find_uniques(same_value_matrix,columnIdx);

     for i=1:size(uniques_of_specific_column,1)
            divided_matrix = fcn_build_unique_matrix(same_value_matrix,uniques_of_specific_column{i,1},columnIdx);

            a_new_measure(1,1:10) = divided_matrix(end,1:10);
            a_new_measure(1,finish_lane:end) = divided_matrix(end,finish_lane:end);
                  for col_number=columnIdx:finish_lane
                         tmp_divided_matrix = unique(divided_matrix(:,col_number));
                          if(size(tmp_divided_matrix,1)==1)
                            a_new_measure{1,col_number} = tmp_divided_matrix{1,1};
                          else
                              if(fcn_check_equal_uniques(divided_matrix,basis_matrix,col_number))
                                  a_new_measure{1,col_number} = 'null';
                                      else
                                             delete('ws_new_measure.mat');
                                              fcn_jump_to_path('fcn_check_columns');
                                              var_filename = 'ws_new_measure.mat';
                                              save(var_filename, 'a_new_measure');
                                              fcn_column_iterations(divided_matrix,basis_matrix,col_number,finish_lane);

                              end
                           end
                  end                          
        
              canBeBundled = fcn_is_bundled(a_new_measure);                           
              if(canBeBundled==1)
                         fcn_add_measure_to_database(a_new_measure);
                         fcn_jump_to_path('fcn_check_columns');
                         var_filename2='ws_can_be_bundled.mat';
                         save(var_filename2,'canBeBundled');
                         if(exist('ws_new_measure.mat','file')==2)
                            delete('ws_new_measure.mat');
                         end
                    
              end
             
     end
end
              
  

