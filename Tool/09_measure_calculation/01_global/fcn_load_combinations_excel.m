function [  ] = fcn_load_combinations_excel()
%Jump file path to save variable
fcn_jump_to_path('fcn_load_combinations_excel');
%Read Combinations Engine.xlsx Excel file
[~, ~, combinations_engine] = xlsread('Combinations Engine.xlsx');
%Delete unnecessary columns
combinations_engine = combinations_engine(:,1:3);
%Save variable as combinations_engine with ws_combinations_engine.mat
var_filename = 'ws_combinations_engine.mat';
save(var_filename, 'combinations_engine');
end

