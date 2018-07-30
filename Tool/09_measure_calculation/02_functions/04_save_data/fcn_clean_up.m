function [  ] = fcn_clean_up(  )
%Deletes every saved variable which is not necessary anymore
if exist('ws_coordinates_converted.mat','file') == 2
    delete('ws_coordinates_converted.mat');
end 
if exist('ws_attribute_type.mat','file') == 2
    delete('ws_attribute_type.mat');
end 

if exist('ws_database_converted.mat','file')==2
    delete('ws_database_converted.mat');
end
if exist('ws_calculation_parts.mat','file')==2
    delete('ws_calculation_parts.mat');
end
if exist('ws_component.mat','file')==2
   delete('ws_component.mat');
end
if exist('ws_database_converted.mat','file')==2
   delete('ws_database_converted.mat');
end
if exist('ws_full_matrix.mat','file')==2
   delete('ws_full_matrix.mat');
end


end

