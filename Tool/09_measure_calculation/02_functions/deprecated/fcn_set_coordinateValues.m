function app = fcn_set_coordinateValues( app,valueName )

 switch valueName
     case 'Licence'
         app.licence_values{1,1}='Licence';
            app.licence_values{1,2} = app.valueLicence.Value;
            app.licence_values{1,3} = app.x1Licence.Value; 
            app.licence_values{1,4} = app.x2Licence.Value;
            app.licence_values{1,5} = app.y1Licence.Value;
            app.licence_values{1,6} = app.y2Licence.Value;
            app.licence_values{1,7} = app.z1Licence.Value;
            app.licence_values{1,8} = app.z2Licence.Value;
     case 'Wheel'
          app.wheel_values{1,1}='Wheel';
            app.wheel_values{1,2} = app.valueWheel.Value;
            app.wheel_values{1,3} = app.x1Wheel.Value; 
            app.wheel_values{1,4} = app.x2Wheel.Value;
            app.wheel_values{1,5} = app.y1Wheel.Value;
            app.wheel_values{1,6} = app.y2Wheel.Value;
            app.wheel_values{1,7} = app.z1Wheel.Value;
            app.wheel_values{1,8} = app.z2Wheel.Value;
     case 'Pedal'
           app.pedal_values{1,1}='Pedal';
            app.pedal_values{1,2} = app.valuePedal.Value;
            app.pedal_values{1,3} = app.x1Pedal.Value; 
            app.pedal_values{1,4} = app.x2Pedal.Value;
            app.pedal_values{1,5} = app.y1Pedal.Value;
            app.pedal_values{1,6} = app.y2Pedal.Value;
            app.pedal_values{1,7} = app.z1Pedal.Value;
            app.pedal_values{1,8} = app.z2Pedal.Value;
     case 'Downforce'
           app.down_values{1,1}='Downforce';
            app.down_values{1,2} = app.valuePedal.Value;
            app.down_values{1,3} = app.x1Down.Value; 
            app.down_values{1,4} = app.x2Down.Value;
            app.down_values{1,5} = app.y1Down.Value;
            app.down_values{1,6} = app.y2Down.Value;
            app.down_values{1,7} = app.z1Down.Value;
            app.down_values{1,8} = app.z2Down.Value;
         
end

