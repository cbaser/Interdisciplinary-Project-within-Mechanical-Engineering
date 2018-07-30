%function [missing_coordinates] = fcn_missingCoordinates(licenceStr,wheelStr,pedalStr,downforceStr)
function [] = fcn_missingCoordinates()
load('ws_licence_matrix.mat');
load('ws_wheel_matrix.mat');
load('ws_pedal_matrix.mat');
load('ws_down_matrix.mat');
%n = length(licence_matrix);
% for i = 8:n
%     licence_matrix{i} = cell2mat(licence_matrix{i});
%     wheel_matrix{i} = cell2mat(wheel_matrix{i});
%     pedal_matrix{i} = cell2mat(pedal_matrix{i});
%     down_matrix{i} = cell2mat(down_matrix{i});
% end
missing_matrix = [licence_matrix ; wheel_matrix ; pedal_matrix ; down_matrix];



%delete('ws_licence_matrix.mat');
%delete('ws_wheel_matrix.mat');
%delete('ws_pedal_matrix.mat');
%delete('ws_down_matrix.mat');

path = which('fcn_missingCoordinates');
slash_id = strfind(path, '\');
path(slash_id(end):end) = [];
cd(path);
var_filename = 'ws_missing_coordinates.mat';
save(var_filename, 'missing_matrix');

end