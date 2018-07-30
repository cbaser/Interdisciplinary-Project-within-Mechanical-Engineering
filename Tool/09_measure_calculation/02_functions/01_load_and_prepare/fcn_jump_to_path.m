function [ ] = fcn_jump_to_path( fileName )
%finds the file name
%and updates the location of that file
 path = which(fileName);
slash_id = strfind(path, '\');
path(slash_id(end):end) = [];
cd(path);



end

