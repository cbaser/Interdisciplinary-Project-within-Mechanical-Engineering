function [ a_new_measure ] = fcn_attributes_iteration( same_value_matrix,basis_matrix,finish_lane,a_new_measure )
%from variante column to max anforderungen column
 for col_number=11:finish_lane
                            %taking unique values of specific column at
                            %same value matrix
                            tmp_same_value_matrix = unique(same_value_matrix(:,col_number));
                            %Step 4
                            %if there is one unique value
                            %that value will be saved into same column into new measure 
                            if(size(tmp_same_value_matrix)==1)
                                a_new_measure{1,col_number} = tmp_same_value_matrix{1,1};
                            else
                                %Step 5
                                %if there are more than one unique values
                                    if(fcn_check_equal_uniques(same_value_matrix,basis_matrix,col_number))
                                        %checking that for that column if they have equal uniques 
                                        %if they have same unique values, column in a new
                                        %measure will be null
                                         a_new_measure{1,col_number} = 'null';
                                    else
                                                %if not, a new measure is
                                                %saved and matrix is split
                                                %according that specific
                                                %column
                                                fcn_jump_to_path('fcn_check_columns');
                                                var_filename_measure = 'ws_new_measure.mat';
                                                save(var_filename_measure, 'a_new_measure');
                                                fcn_column_iterations(same_value_matrix,basis_matrix,col_number,finish_lane);
                                                a_new_measure = cell(1,size(same_value_matrix,2));
                                                break;
                                    end
                            end
  end   
end 
         
