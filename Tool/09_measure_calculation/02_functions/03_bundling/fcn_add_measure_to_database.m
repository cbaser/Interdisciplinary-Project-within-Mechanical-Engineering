function [ ] = fcn_add_measure_to_database(a_new_measure)
%loads full matrix and adds measure to full matrix
                        fcn_jump_to_path('fcn_start_calculation');
                        load('ws_full_matrix.mat');
                        full_matrix = [full_matrix;a_new_measure];
                        fcn_jump_to_path('fcn_start_calculation');
                        delete('ws_full_matrix.mat');
                        var_filename = 'ws_full_matrix.mat';
                        save(var_filename, 'full_matrix');                            
    end


