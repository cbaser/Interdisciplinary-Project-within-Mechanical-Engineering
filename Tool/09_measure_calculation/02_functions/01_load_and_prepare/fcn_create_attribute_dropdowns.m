function app = fcn_create_attribute_dropdowns(app)
%Function reads the information from excel sheet and create dropdowns
%automatically
load('ws_global_attributes.mat', 'glo_names_attribute', 'glo_names_criteria', 'glo_names_possibilities');
panel = app.AttributenPanel;
attributes_name = glo_names_criteria;
attributes_values = glo_names_possibilities;
len_att = length(attributes_name);
pos_y = ((ceil((len_att) / 5)+2)*60);

load('ws_attribute_type.mat');
value_name = strcat('ws_',attribute_type);
attribute_name = strcat(value_name,'_attributes.mat');
value_name = strcat(value_name,'_values.mat');

for i=1:len_att
    x_1 = 170 * rem(i-1 ,5) + 15;
    y_1 = pos_y - ceil(i / 5) * 60;
    label(i) = uilabel(panel,'Position',[x_1 y_1 155 30], 'Text', attributes_name{i,2}, 'HorizontalAlignment', 'center', 'fontsize', 16);
    attributes_values{i,1} = [{'null'}; attributes_values{i,1}(:)];
    % prepare Position
    x_2 = 170 * rem(i-1 ,5) + 15;
    y_2 = pos_y - 10 - ceil(i / 5) * 60;
    % create dropdown
     app.dropdown_2(i) = uidropdown(panel, 'Position', [x_2 y_2 155 22], 'Items', attributes_values{i,1}, 'fontsize', 16);
     
  if(exist(attribute_name,'file')==2)
    load(attribute_name);
    app.dropdown_2(i).Value = attributes_matrix{i,1};
    end
end
x_3 = 15;
y_3 = pos_y - 20 - (ceil(i / 5)+1)* 60;
Button_set = uibutton(panel, 'Text', 'OK', 'Position',...
    [x_3 , y_3, 325, 30], 'fontsize', 16, 'ButtonPushedFcn', @(Button_set, event) fcn_keep_attributes(Button_set, app));

end


function app = fcn_keep_attributes(~,app)
load('ws_global_attributes.mat', 'glo_names_attribute', 'glo_names_criteria', 'glo_names_possibilities');
attributes_name = glo_names_criteria;

    len_attrbiutes = length(attributes_name);    
    attributes_matrix = cell(len_attrbiutes,1);
    for j=1:len_attrbiutes
    attributes_matrix{j,1} = app.dropdown_2(1,j).Value;
    end
fcn_jump_to_path('fcn_create_attribute_dropdowns');
load('ws_attribute_type.mat');
attribute_name = strcat('ws_',attribute_type,'_attributes.mat');
         save(attribute_name, 'attributes_matrix');
         delete(app);
end

