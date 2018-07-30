function [ app ] = fcn_fill_database_table( app )
%Filling the database table after calculation
load('ws_database_raw.mat');
app.DatabaseTable.Data = database_raw;
load('ws_global_attributes.mat','glo_names_all');
app.DatabaseTable.ColumnName = glo_names_all(:,2);

end

