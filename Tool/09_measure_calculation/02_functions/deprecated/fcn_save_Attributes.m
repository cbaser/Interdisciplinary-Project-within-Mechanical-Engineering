function [ ] = fcn_save_Attributes( app )
 gui_path = which('fcn_save_Attributes');
 slash_id=strfind(gui_path,'\');
 gui_path(slash_id(end):end)=[];
 cd(gui_path);
switch app.attribute_type
    case 'Licence'
         licence_matrix = [app.values, app.licence_attributes];       
            var_filename = 'ws_licence_matrix.mat';
            save(var_filename, 'licence_matrix');
            msgbox('Attributes saved in Matlab');
    case 'Wheel'
            wheel_matrix = [app.values, app.wheel_attributes];       
            var_filename = 'ws_wheel_matrix.mat';
            save(var_filename, 'wheel_matrix');
            msgbox('Attributes saved in Matlab');
     case 'Pedal'
             pedal_matrix = [app.values, app.pedal_attributes];       
             var_filename = 'ws_pedal_matrix.mat';
             save(var_filename, 'pedal_matrix');
             msgbox('Attributes saved in Matlab');
     case 'Down'
             down_matrix = [app.values, app.down_attributes];       
             var_filename = 'ws_down_matrix.mat';
             save(var_filename, 'down_matrix');
             msgbox('Attributes saved in Matlab');
end

