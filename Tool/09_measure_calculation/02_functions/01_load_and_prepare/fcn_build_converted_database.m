function [ converted_arr ] = fcn_build_converted_database( )
load('ws_database_raw.mat');
%create converted array with same size of database
converted_arr = zeros(size(database_raw, 1), size(database_raw, 2));
load('ws_global_attributes.mat', 'glo_names_possibilities','glo_names_vehicle','glo_names_criteria');


  for row=1:size(database_raw,1)
            for column=1:size(database_raw,2)
                %if the values are null we change to 0
                 if(strcmp(database_raw(row,column),'null'))
                    converted_arr(row,column) = 0;  
                 end
               
                 if(strcmp(database_raw(row,column),'ja'))
                    converted_arr(row,column) = 1;
                 end

                if(strcmp(database_raw(row,column),'nein'))
                    converted_arr(row,column) = 2;             
                end             
            end  
            
             
  end
  %It is checked which vehicle type they have and converted array is
  %changed according the same index
  %For example Fahrzeug4 in 10th row and 2nd column
  %In converted array 10th row and 2nd column will be 4
     for i=1:size(glo_names_vehicle,1)
        [ro ,col] = find(strcmp(database_raw,glo_names_vehicle(i,1)));
        converted_arr(ro,col) = i;
     end
   

for j=1:size(glo_names_criteria,1)
    %Same logic above with other remaining attributes
     converted_arr = convert2numbers_mc(converted_arr,database_raw(:,glo_names_criteria{j,1}),glo_names_criteria{j,1},j);
 end

%save converted array
fcn_jump_to_path('fcn_load_database');
 var_filename = 'ws_database_converted.mat';
save(var_filename, 'converted_arr');
end

