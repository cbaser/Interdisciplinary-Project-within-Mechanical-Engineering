function [ ] = fcn_check_coordinates( )
%this function gets array of row indexes and compares them according the converted database
%Sends the information that into build combination matrix function that
%value is coming from missing coordinates part
missingCoordinate=1;
load('ws_compared_indexes_coordinates');
first_length = nnz(indexes_coordinates(:,1)); 
second_length = nnz(indexes_coordinates(:,2)); 
probabilty_array_coordinates = [];
for i=1:first_length
    for j=1:second_length
       trueOrFalse= fcn_compare_coordinates(i,j);
       if(trueOrFalse ~= 0)
            %comparing coordinates according to their converted version if
            %boolean value is 1 
            %these two row indexes can be combined and they are added into
            %probabilty_array
           probabilty_array_coordinates=[probabilty_array_coordinates ; indexes_coordinates(i,1) indexes_coordinates(j,2)];           
       end
    end
end

var_filename = 'ws_probability_array_coordinates.mat';
save(var_filename, 'probabilty_array_coordinates');
if(size(probabilty_array_coordinates,1)~=0)
    fcn_build_combination_matrix(missingCoordinate);
end

end

