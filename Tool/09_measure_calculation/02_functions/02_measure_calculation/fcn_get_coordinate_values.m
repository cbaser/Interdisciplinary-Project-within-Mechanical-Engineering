function [ combination ] = fcn_get_coordinate_values(  )
load('ws_probability_array_coordinates.mat');
load('ws_database_raw.mat');
load('ws_calculation_parts.mat');
load('ws_missing_coordinates.mat');

first_matrix={};
second_matrix={};
combination = {};


%That function basically combines two different missing coordinates which is
%checked before according to their attributes and put into
%probabilty_array_coordinates

%Find the max id number either from database or create from strach if there
%is any


if(exist('ws_full_matrix.mat','file')~=2)
max_id = max([database_raw{:,1}]);
else
    load('ws_full_matrix.mat');
    max_id=max([full_matrix{:,1}]);
end
for i=1:size(probabilty_array_coordinates,1)
    max_id = max_id +1;
    %Add max id number to one for new entry at combination array
    
    %get first and second missing coordinate index value from missing
    %coordinates matrix
    %For example first and third row from missing coordinates array
    if(~contains(parts{1,1},'_') && ~contains(parts{1,2},'_'))
          combination(i,:) = missing_matrix(probabilty_array_coordinates(i,1),:);
          second_matrix(i,:)= missing_matrix(probabilty_array_coordinates(i,2),:);           
            combination{i,5} = missing_matrix{probabilty_array_coordinates(i,1),6};
            combination{i,6} = missing_matrix{probabilty_array_coordinates(i,2),5};
            
            
            combination{i,8} = missing_matrix{probabilty_array_coordinates(i,2),7};
          
            combination{i,10} = missing_matrix{probabilty_array_coordinates(i,2),9}; 
            
     
     end
     
     if(~contains(parts{1,1},'_') && contains(parts{1,2},'_'))
           combination(i,:) = missing_matrix(probabilty_array_coordinates(i,1),:);
           second_matrix(i,:)= database_raw(probabilty_array_coordinates(i,2),:);                     
           
           combination{i,5} = missing_matrix{probabilty_array_coordinates(i,1),5};
           combination{i,6} =  second_matrix{i,5};
                
        
           combination{i,8} = second_matrix{i,7};
                
                           
           combination{i,10} = second_matrix{i,9};             
                 
                 combination{i,1} = max_id;


     end
     if(contains(parts{1,1},'_') && ~contains(parts{1,2},'_'))
         combination(i,:) = database_raw(probabilty_array_coordinates(i,1),:);
         second_matrix(i,:)= missing_matrix(probabilty_array_coordinates(i,2),:);              
                
                 combination{i,5} = database_raw{probabilty_array_coordinates(i,1),5};
                 combination{i,6} = second_matrix{i,5};
                 
                
                 combination{i,8} = second_matrix{i,7};
                 
                 
                 combination{i,10} = second_matrix{i,9};             
                 combination{i,1} = max_id;

     end
     if(contains(parts{1,1},'_') && contains(parts{1,2},'_'))
         load('ws_measures.mat');
         if(contains(measure_cells{1,2},'B'))
             combination(i,:) = database_raw(probabilty_array_coordinates(i,1),:);
             second_matrix(i,:)= missing_matrix(probabilty_array_coordinates(i,2),:); 
              
              combination{i,5} = database_raw{probabilty_array_coordinates(i,1),5};
              combination{i,6} = second_matrix{i,5};
              
             
              combination{i,8} = second_matrix{i,7};
              
              combination{i,10} = second_matrix{i,9};  
              
              combination{i,1} = max_id;


         end
         if(contains(measure_cells{1,1},'B'))
                 combination(i,:) = missing_matrix(probabilty_array_coordinates(i,1),:);
                 second_matrix(i,:)= database_raw(probabilty_array_coordinates(i,2),:);                     
                 combination{i,5} = missing_matrix{probabilty_array_coordinates(i,1),5};
                 combination{i,6} =  second_matrix{i,5};               
                 combination{i,8} = second_matrix{i,7};                           
                 combination{i,10} = second_matrix{i,9};                            
                 combination{i,1} = max_id;
                 
         end
     end
     

    for j=1:size(combination,2)
        if(strcmp(combination{i,j},'null'))
         combination{i,j} = second_matrix{i,j};
        end
    end
    
    load('ws_component.mat');
    if(contains(component_cell{1,1},'X'))
    combination{i,4} = (-combination{i,5}+combination{i,6});
    end
    if(contains(component_cell{1,1},'Y'))
    combination{i,4} = (-combination{i,7}+combination{i,8});
    end
    if(contains(component_cell{1,1},'Z'))
        combination{i,4} = (-combination{i,9}+combination{i,10});
    end
    
            
   
    fcn_jump_to_path('fcn_get_combination_values');
    var_filename = 'ws_combination_values.mat';
    save(var_filename, 'combination');
end
  end   


