function  app  = fcn_set_coordinateAttributes( app,attributeName,attributeValue )
load('ws_global_attributes.mat','glo_names_all');
glo_names_all = glo_names_all(11:end,:);
glo_names_all = glo_names_all(:,2);
[ro,~] = find(strcmp(glo_names_all,attributeName));
switch app.attribute_type
     case 'Licence'
        app.licence_attributes{1,ro} = attributeValue;
     case 'Wheel'
         app.wheel_attributes{1,ro} = attributeValue;
     case 'Pedal'
          app.pedal_attributes{1,ro} = attributeValue;
     case 'Downforce'
           app.down_attributes{1,ro} = attributeValue;

end

