function [  ] = fcn_check_numbers( )
%this function gets array of row indexes and compares them according the converted database
%Sends the information that into build combination matrix function that value is coming from not missing coordinates part
missingCoordinate = 0;

load('ws_compared_indexes');
first_length = nnz(indexes(:,1)); 
second_length = nnz(indexes(:,2)); 
probabilty_array = [];
if(indexes(:,1)==0 )
    return;
end
if(indexes(:,2)==0)
    return;
end
	for i=1:first_length
        for j=1:second_length
            %comparing numbers according to their converted version if
            %boolean value is 1 
            %these two row indexes can be combined and they are added into
            %probabilty_array
           trueOrFalse= fcn_compare_numbers(i,j);
               if(trueOrFalse ~= 0)
                   
                   probabilty_array=[probabilty_array ; indexes(i,1) indexes(j,2)];           
               end
        end
    end
fcn_jump_to_path('fcn_start_calculation');
var_filename = 'ws_probability_array.mat';
save(var_filename, 'probabilty_array');
    if(size(probabilty_array,1) ~=0)
        fcn_build_combination_matrix(missingCoordinate);
    end
end
