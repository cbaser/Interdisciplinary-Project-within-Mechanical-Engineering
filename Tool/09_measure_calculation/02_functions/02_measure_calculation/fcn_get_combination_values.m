function [ combination ] = fcn_get_combination_values(  )
load('ws_probability_array.mat');
load('ws_database_raw.mat');
load('ws_calculation_parts.mat');
load('ws_component.mat');  
%second_matrix={};
%combination = {};

%That function basically combines two different points which is
%checked before according to their attributes and put into probabilty_array

%Find the max id number either from database or create from strach if there
%is any
max_id=0;
if(exist('ws_full_matrix.mat','file')~=2)
max_id = max([database_raw{:,1}]);
else
    load('ws_full_matrix.mat');
    max_id=max([full_matrix{:,1}]);
end

for i=1:size(probabilty_array,1)
    %Add max id number to one for new entry at combination array
    max_id = max_id +1;
    %get first and second probabilty_array index value from database
    %For example first and third row from database
    combination(i,:) = database_raw(probabilty_array(i,1),:);     
    second_matrix(i,:)= database_raw(probabilty_array(i,2),:);

    %and set other real values from one and another with crossed thought 
    
    combination{i,7} = database_raw{probabilty_array(i,1),8};
    combination{i,8} = second_matrix{i,7};
    combination{i,9} = database_raw{probabilty_array(i,1),10};
    combination{i,10} = second_matrix{i,9};  
    
    if(strcmp(parts{1,1},'_2') && strcmp(parts{1,2},'_1'))
    combination{i,5} = database_raw{probabilty_array(i,1),6};
    combination{i,6} = second_matrix{i,5};
    end
     if(strcmp(parts{1,1},'_1') && strcmp(parts{1,2},'_1'))
    combination{i,5} = database_raw{probabilty_array(i,1),5};
    combination{i,6} = second_matrix{i,5};
    
     end
     %if one of the value is not null
     %the value is kept
    for j=1:size(combination,2)
        if(strcmp(combination{i,j},'null'))
         combination{i,j} = second_matrix{i,j};
        end
    end
            
   
   %Real value is updated according to second letter and rounded
    if(contains(component_cell{1,1},'X'))
    combination{i,4} = (-combination{i,5}+combination{i,6});
    end
    if(contains(component_cell{1,1},'Y'))
    combination{i,4} = (-combination{i,7}+combination{i,8});
    end
    if(contains(component_cell{1,1},'Z'))
        combination{i,4} = (-combination{i,9}+combination{i,10});
    end
    combination{i,1} = max_id;
    combination{i,4} = round(combination{i,4},2);
    %saving combination values in one array
    fcn_jump_to_path('fcn_get_combination_values');
    var_filename = 'ws_combination_values.mat';
    save(var_filename, 'combination');
end
    
end





