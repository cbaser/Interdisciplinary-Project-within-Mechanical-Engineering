function [  ] = fcn_keep_component( component )
%keeps incoming component name and saves it
component_cell = cell(1,1);
component_cell{1,1}=component;
fcn_jump_to_path('fcn_keep_component');
  var_filename = 'ws_component.mat';
save(var_filename, 'component_cell');

end

