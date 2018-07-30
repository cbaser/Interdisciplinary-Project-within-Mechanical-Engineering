function app = fcn_reset_missing_coordinates( app,attribute_type )
load('ws_global_attributes.mat','glo_names_vehicle');
%Reset all values according the attributes type
switch attribute_type
    case 'Kennzeichentrager'
            app.RadplatteDropDown.Value=glo_names_vehicle{1,1};
            app.x1Kennzeichentrager.Value=0;        
            app.y1Kennzeichentrager.Value=0;
            app.z1Kennzeichentrager.Value=0;
    case 'Radplatte'
            app.RadplatteDropDown.Value=glo_names_vehicle{1,1};
            app.x1Radplatte.Value=0;        
            app.y1Radplatte.Value=0;
            app.z1Radplatte.Value=0;
    case 'Pedal'
            app.PedalDropDown.Value=glo_names_vehicle{1,1};
            app.x1Pedal.Value=0;        
            app.y1Pedal.Value=0;
            app.z1Pedal.Value=0;
    case 'Abtrieb'
            app.AbtriebDropDown.Value=glo_names_vehicle{1,1};
            app.x1Abtrieb.Value=0;        
            app.y1Abtrieb.Value=0;
            app.z1Abtrieb.Value=0;
    case 'Exhaust'
            app.ExhaustDropDown.Value=glo_names_vehicle{1,1};
            app.x1Exhaust.Value=0;        
            app.y1Exhaust.Value=0;
            app.z1Exhaust.Value=0;
    case 'Abgasanlage'
           app.AbgasanlageDropDown.Value=glo_names_vehicle{1,1};
           app.x1Abgasanlage.Value=0;        
           app.y1Abgasanlage.Value=0;
           app.z1Abgasanlage.Value=0;
    case 'BKV'
           app.BKVDropDown.Value=glo_names_vehicle{1,1};
           app.x1BKV.Value=0;        
           app.y1BKV.Value=0;
           app.z1BKV.Value=0;
    case 'SQT'
           app.SQTDropDown.Value=glo_names_vehicle{1,1};
           app.x1SQT.Value=0;        
           app.y1SQT.Value=0;
           app.z1SQT.Value=0;
    case 'CMS'
             app.CMSDropDown.Value=glo_names_vehicle{1,1};
             app.x1CMS.Value=0;        
             app.y1CMS.Value=0;
             app.z1CMS.Value=0;
    case 'Getriebeflansch'
            app.GetriebeflanschDropDown.Value=glo_names_vehicle{1,1};
            app.x1Getriebeflansch.Value=0;        
            app.y1Getriebeflansch.Value=0;
            app.z1Getriebeflansch.Value=0;
end

      
end




