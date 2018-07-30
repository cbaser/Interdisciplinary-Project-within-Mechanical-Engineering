function  app  = fcn_get_vehicles( app )
%Filling the dropdowns with the vehicle names
load('ws_global_attributes.mat');
app.KennzeichentragerDropDown.Items = glo_names_vehicle;
app.RadplatteDropDown.Items = glo_names_vehicle;
app.PedalDropDown.Items = glo_names_vehicle;
app.AbtriebDropDown.Items = glo_names_vehicle;
app.ExhaustDropDown.Items = glo_names_vehicle;
app.AbgasanlageDropDown.Items = glo_names_vehicle;
app.BKVDropDown.Items = glo_names_vehicle;
app.SQTDropDown.Items = glo_names_vehicle;
app.CMSDropDown.Items = glo_names_vehicle;
app.GetriebeflanschDropDown.Items = glo_names_vehicle;

end

