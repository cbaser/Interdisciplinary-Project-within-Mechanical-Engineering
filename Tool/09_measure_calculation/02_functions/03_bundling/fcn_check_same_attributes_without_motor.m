function [  ] = fcn_check_same_attributes_without_motor( engine_power,engine_torque,finish_lane )
load('ws_full_matrix.mat');
%That function basically finds the rows which have same attributes without
%motor power and motor torque
%Then for founded rows these two columns are set to null 
check_same_with_exception(full_matrix,engine_power,engine_torque,finish_lane);
end
function [] = check_same_with_exception(full_matrix,engine_power,engine_torque,finish_lane)
with_duplicates = [];
for d=11:finish_lane
    if(d==engine_power || d==engine_torque)
        continue;
    end
with_duplicates= strcat(with_duplicates,full_matrix(:,d));
end
[~,~,indexes] = unique(with_duplicates);
unique_indexes = unique(indexes);
hist = histc(indexes,unique_indexes);
more_than_one_occuruences = unique_indexes(hist>1);
out = find(ismember(indexes,more_than_one_occuruences(1:end)));

for i=1:size(out,1)
    full_matrix{out(i,1),engine_power}='null';
    full_matrix{out(i,1),engine_torque}='null';
end

 fcn_jump_to_path('fcn_start_calculation');
  delete('ws_full_matrix.mat');
  var_filename = 'ws_full_matrix.mat';
  save(var_filename, 'full_matrix');  

end


