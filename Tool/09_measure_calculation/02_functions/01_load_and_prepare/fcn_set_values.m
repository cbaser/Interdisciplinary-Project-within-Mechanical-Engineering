function [  ] = fcn_set_values( app,attribute_type )
%keeping the incoming values for incoming attribute type
value_matrix = cell(1,10);
fcn_jump_to_path('fcn_set_values');
 value_matrix{1,1}=[];
 
 value_matrix{1,4} = 0;
 value_matrix{1,6} = 0;
 value_matrix{1,8} = 0;
 value_matrix{1,10} = 0;
switch attribute_type
    case 'Kennzeichentrager'
            value_matrix{1,2} = app.KennzeichentragerDropDown.Value;
            value_matrix{1,3} = attribute_type;
            value_matrix{1,5} = app.x1Kennzeichentrager.Value;        
            value_matrix{1,7} = app.y1Kennzeichentrager.Value;
            value_matrix{1,9} = app.z1Kennzeichentrager.Value;
    case 'Radplatte'
            value_matrix{1,2} = app.RadplatteDropDown.Value;
            value_matrix{1,3} = attribute_type;
            value_matrix{1,5} = app.x1Radplatte.Value;        
            value_matrix{1,7} = app.y1Radplatte.Value;
            value_matrix{1,9} = app.z1Radplatte.Value;
    case 'Pedal'
            value_matrix{1,2} = app.PedalDropDown.Value;
            value_matrix{1,3} = attribute_type;
            value_matrix{1,5} = app.x1Pedal.Value;        
            value_matrix{1,7} = app.y1Pedal.Value;
            value_matrix{1,9} = app.z1Pedal.Value;
    case 'Abtrieb'
            value_matrix{1,2} = app.AbtriebDropDown.Value;
            value_matrix{1,3} = attribute_type;
            value_matrix{1,5} = app.x1Abtrieb.Value;        
            value_matrix{1,7} = app.y1Abtrieb.Value;
            value_matrix{1,9} = app.z1Abtrieb.Value;
    case 'Exhaust'
            value_matrix{1,2} = app.ExhaustDropDown.Value;
            value_matrix{1,3}='BX15b';
            value_matrix{1,5} = app.x1Exhaust.Value;        
            value_matrix{1,7} = app.y1Exhaust.Value;
            value_matrix{1,9} = app.z1Exhaust.Value;
    case 'Abgasanlage'
            value_matrix{1,2} = app.AbgasanlageDropDown.Value;
            value_matrix{1,3}= 'BY13d';
            value_matrix{1,5} = app.x1Abgasanlage.Value;        
            value_matrix{1,7} = app.y1Abgasanlage.Value;
            value_matrix{1,9} = app.z1Abgasanlage.Value;
    case 'BKV'
            value_matrix{1,2} = app.BKVDropDown.Value;
            value_matrix{1,3} = 'BX19c';
            value_matrix{1,5} = app.x1BKV.Value;        
            value_matrix{1,7} = app.y1BKV.Value;
            value_matrix{1,9} = app.z1BKV.Value;
    case 'SQT'
            value_matrix{1,2} = app.SQTDropDown.Value;
            value_matrix{1,3} = 'BX114';
            value_matrix{1,5} = app.x1SQT.Value;        
            value_matrix{1,7} = app.y1SQT.Value;
            value_matrix{1,9} = app.z1SQT.Value;
    case 'CMS'
            value_matrix{1,2} = app.CMSDropDown.Value;
            value_matrix{1,3} = 'BX115';
            value_matrix{1,5} = app.x1CMS.Value;        
            value_matrix{1,7} = app.y1CMS.Value;
            value_matrix{1,9} = app.z1CMS.Value;
    case 'Getriebeflansch'
            value_matrix{1,2} = app.GetriebeflanschDropDown.Value;
            value_matrix{1,3} = 'BX119a';
            value_matrix{1,5} = app.x1Getriebeflansch.Value;        
            value_matrix{1,7} = app.y1Getriebeflansch.Value;
            value_matrix{1,9} = app.z1Getriebeflansch.Value;
end
            var_filename=strcat('ws_',attribute_type,'_values.mat');
            save(var_filename, 'value_matrix');

end

