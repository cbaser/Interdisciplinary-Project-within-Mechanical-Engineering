function [  ] = fcn_keep_measures( firstDimension,secondDimension )
%keeps the measures and saves them
measure_cells = cell(1,2);
measure_cells{1,1}=firstDimension;
measure_cells{1,2}=secondDimension;
fcn_jump_to_path('fcn_keep_measures');
  var_filename = 'ws_measures.mat';
save(var_filename, 'measure_cells');

end

