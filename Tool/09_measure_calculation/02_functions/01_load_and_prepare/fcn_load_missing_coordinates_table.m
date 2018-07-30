function app = fcn_load_missing_coordinates_table( app )
%fills the missing coordinates table if there is information in missing coordinates matrix 
        if(exist('ws_missing_coordinates.mat','file')==2)
            load('ws_missing_coordinates.mat');
            app.CoordinatesTable.Data = missing_matrix;
            if(exist('ws_global_attributes.mat','file')==2)
            load('ws_global_attributes.mat','glo_names_all');
            app.CoordinatesTable.ColumnName = glo_names_all(:,2);
            end      
        else
            app.CoordinatesTable.Data = {};
            app.CoordinatesTable.ColumnName={};       
        end

end