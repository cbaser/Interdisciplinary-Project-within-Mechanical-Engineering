function [  ] = fcn_fill_calculation_table( app )
%Filling the calculation table in berechnung Tab
msgbox('Die Tabelle ist gefüllt.');
load('ws_full_matrix.mat');
load('ws_global_attributes.mat','glo_names_all');
app.CalculationTable.Data = full_matrix; 
app.CalculationTable.ColumnName = glo_names_all(:,2);
app.TotalValuesLabel.Text = strcat ( 'Gesamter Anzahl der Werte : ',num2str(size(full_matrix,1)));

end

