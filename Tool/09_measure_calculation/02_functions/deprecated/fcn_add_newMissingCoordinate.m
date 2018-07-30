function [ ] = fcn_add_newMissingCoordinate( app )
load('ws_missing_coordinates','missing_matrix');
full_matrix={};
app.values{1,2} = app.value.Value;
            app.values{1,3} = app.x1.Value; 
            app.values{1,4} = app.x2.Value;
            app.values{1,5} = app.y1.Value;
            app.values{1,6} = app.y2.Value;
            app.values{1,7} = app.z1.Value;
            app.values{1,8} = app.z2.Value;   
switch app.attribute_type
     case 'Licence'
            app.values{1,1}='Licence'; 
            full_matrix = [app.values, app.licence_attributes]; 
            missing_matrix = [missing_matrix;full_matrix];
     case 'Wheel'
             app.values{1,1}='Wheel';     
             full_matrix = [app.values, app.wheel_attributes]; 
             missing_matrix = [missing_matrix;full_matrix];
     case 'Pedal'
            app.values{1,1}='Pedal';          
             full_matrix = [app.values, app.pedal_attributes]; 
             missing_matrix = [missing_matrix;full_matrix];
     case 'Down'
           app.values{1,1}='Downforce';    
            full_matrix = [app.values, app.down_attributes]; 
             missing_matrix = [missing_matrix;full_matrix];
end
            
var_filename = 'ws_missing_coordinates.mat';
save(var_filename, 'missing_matrix');

end

