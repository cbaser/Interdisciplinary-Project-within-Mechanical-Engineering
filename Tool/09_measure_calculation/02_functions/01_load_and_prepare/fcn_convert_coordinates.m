function [  ] = fcn_convert_coordinates(  )
%create converted array with same size of database
load('ws_missing_coordinates.mat');
load('ws_global_attributes.mat', 'glo_names_possibilities','glo_names_vehicle','glo_names_criteria');
converted_coordinates = zeros(size(missing_matrix, 1), size(missing_matrix, 2));
 for i=1:size(glo_names_vehicle,1)
        [ro ,col] = find(strcmp(missing_matrix,glo_names_vehicle(i,1)));
        converted_coordinates(ro,col) = i;
    end
  for row=1:size(missing_matrix,1)
            for column=1:size(missing_matrix,2)
                %if the values are null we change to 0
                 if(strcmp(missing_matrix(row,column),'null'))
                    converted_coordinates(row,column) = 0;  
                 end
               
                 if(strcmp(missing_matrix(row,column),'ja'))
                    converted_coordinates(row,column) = 1;
                 end

                if(strcmp(missing_matrix(row,column),'nein'))
                    converted_coordinates(row,column) = 2;             
                end             
            end  
            
             
  end
  for i=1:size(glo_names_vehicle,1)
      %It is checked which vehicle type they have and converted array is
  %changed according the same index
  %For example Fahrzeug4 in 10th row and 2nd column
  %In converted array 10th row and 2nd column will be 4
        [ro ,col] = find(strcmp(missing_matrix,glo_names_vehicle(i,1)));
        converted_coordinates(ro,col) = i;
  end
 for j=1:size(glo_names_criteria,1)
     %Same logic above with other remaining attributes
     converted_coordinates = convert2numbers_mc(converted_coordinates,missing_matrix(:,glo_names_criteria{j,1}),glo_names_criteria{j,1},j);
 end

    fcn_jump_to_path('fcn_convert_coordinates');
     var_filename = 'ws_coordinates_converted.mat';
save(var_filename, 'converted_coordinates');

end

