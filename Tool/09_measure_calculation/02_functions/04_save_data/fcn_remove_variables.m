function [  ] = fcn_remove_variables(  )
%Removes unnecessary values if there is any
fcn_jump_to_path('fcn_start_calculation');
if exist('ws_combination_values.mat','file')==2
    delete('ws_combination_values.mat');
end
if exist('ws_probability_array_coordinates.mat','file')==2
    delete('ws_probability_array_coordinates.mat');
end
if exist('ws_probability_array.mat','file') == 2
    delete('ws_probability_array.mat');
end 
if exist('ws_attribute_type.mat','file') == 2
    delete('ws_attribute_type.mat');
end 
if exist( 'ws_measures.mat','file')==2
    delete('ws_measures.mat');
end
if exist('ws_calculation_parts.mat','file')==2
    delete('ws_calculation_parts.mat');
end
if exist('ws_component.mat','file')==2
    delete('ws_component.mat');
end
if exist('ws_compared_indexes.mat','file')==2
    delete('ws_compared_indexes.mat');
end
if exist('ws_compared_indexes_coordinates.mat','file')==2
    delete('ws_compared_indexes_coordinates.mat');
end

end

