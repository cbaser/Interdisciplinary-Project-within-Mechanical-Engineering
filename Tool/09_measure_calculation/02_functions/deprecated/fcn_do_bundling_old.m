function [  ] = fcn_do_bundling_old(  )
load('ws_full_matrix.mat');
unique_variables=fcn_find_unique_values(full_matrix(:,4));
for i=1:size(unique_variables,1)
    load('ws_full_matrix.mat');
    [row,~] = find(cell2mat(full_matrix(:,4))==unique_variables(i,1));
    if(unique_variables(i,1)==42.200000000000000)
        disp('HOP');
    end
     if(~contains(full_matrix(row,3),'BX15') & ...
           ~contains(full_matrix(row,3),'BY12') & ...
           ~contains(full_matrix(row,3),'EZ11'))
        fcn_check_motor_attributes(row);
   
     end

 disp(i);
    fcn_check_columns(row);
end
fcn_prepare_for_saving();

end



