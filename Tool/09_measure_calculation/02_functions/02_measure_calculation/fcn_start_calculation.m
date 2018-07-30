function [] = fcn_start_calculation( )
%Main function which is called from GUI
%fcn_start_calculation starts with calculation then bundling and finally
%saving into database.

%Reload and retrieve combinations from Excel file
fcn_load_combinations_excel();
load('ws_combinations_engine.mat');
msgbox('Beginn der Berechnung');
for i=1:size(combinations_engine,1)
        %send component and two corresponding points to calculation_mc from
        %excel file
        fcn_calculation_mc(combinations_engine(i,1),combinations_engine(i,2),combinations_engine(i,3));
end
fcn_remove_variables();
 msgbox('Ende der Berechnung, Bundling  beginnt!');
 %fcn_start_bundling();
   msgbox('Bundling ist fertig, Bitte wahlen Sie datenbenk zum speichern !');
 %fcn_save_database();



end

