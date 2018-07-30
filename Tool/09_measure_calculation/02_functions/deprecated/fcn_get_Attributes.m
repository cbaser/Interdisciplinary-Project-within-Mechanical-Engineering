function app = fcn_get_Attributes( app )
load('ws_global_attributes.mat','glo_names_all');
glo_names_all = glo_names_all(11:end,:);
app.AttributeDropDown.Items = glo_names_all(:,2);

end

