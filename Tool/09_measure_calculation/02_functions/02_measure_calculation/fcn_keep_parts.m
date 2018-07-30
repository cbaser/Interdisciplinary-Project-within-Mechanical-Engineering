function [  ] = fcn_keep_parts( firstPart,secondPart )
%keeps incoming parts and saves them
parts= cell(1,2);
parts{1,1} = firstPart;
parts{1,2} = secondPart;

fcn_jump_to_path('fcn_keep_parts');
  var_filename = 'ws_calculation_parts.mat';
save(var_filename, 'parts');
end

