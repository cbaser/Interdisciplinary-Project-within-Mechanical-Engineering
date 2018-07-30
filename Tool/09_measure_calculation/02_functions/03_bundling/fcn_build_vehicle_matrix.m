function [ vehicle_matrix ] = fcn_build_vehicle_matrix( vehicle_type )
%building vehicle matrix according to incoming vehicle type
 load('ws_database_raw.mat');
 vehicle_matrix = {};
 [row_1,~] = find(strcmp(database_raw(:,2),vehicle_type));
 for j=1:size(row_1,1)
            vehicle_matrix = [vehicle_matrix;database_raw(row_1(j,1),:)];
 end 


end

