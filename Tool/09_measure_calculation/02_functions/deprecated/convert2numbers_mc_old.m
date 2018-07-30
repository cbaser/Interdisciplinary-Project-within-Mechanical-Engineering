function [  ] = convert2numbers_mc_old()

load('ws_global_attributes.mat', 'glo_names_possibilities','glo_names_vehicle');
possibilities = glo_names_possibilities;
names = glo_names_vehicle;
load('ws_database_raw.mat');


converted_arr = zeros(size(database_raw, 1), size(database_raw, 2));

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
    for i=1:size(names,1)
        [ro ,col] = find(strcmp(database_raw,glo_names_vehicle(i,1)));
        converted_arr(ro,col) = i;
    end
%     for i=1:size(names,1)
%          [ro,col] = ind2sub(size(database_raw),find(cellfun(@(x)strcmp(x,names{i,1}),database_raw)));
%          converted_arr(ro,col) = i;
%     end
    
    %for loop for rows of possibilities excel sheet
%         for i=1:size(possibilities,1)
%     %for loop for inner possibilites 
%           for j=1: possibilities{i,2}
%             %find the rows and columns and change the value
%              [ro,col] = ind2sub(size(database_raw),find(cellfun(@(x)strcmp(x,possibilities{i,1}{j}),database_raw)));
%                converted_arr(ro,col) = j;
%           end
%         end
%n = max(cellfun(@(x)size(x,2),tmp))
    for i=1:size(possibilities,1)
        for j=1:possibilities{i,2}
             [ro ,col] = find(strcmp(database_raw,possibilities{i,1}{j}));
             if(converted_arr(ro,col) ==0)
             converted_arr(ro,col)=j;
             end
        end
    end
      
      %  disp(converted_arr);
       var_filename = 'ws_database_converted.mat';
save(var_filename, 'converted_arr');

end


