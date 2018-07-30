function app = fcn_delete_coordinate( app )
%checks the information for selected_cells and deletes that specific cell
%from missing coordinates array
fcn_jump_to_path('fcn_delete_coordinate');
load('ws_missing_coordinates.mat');
 if(~isempty(app.selected_cells))
                if(size(app.selected_cells(1)) ==1)
                    
                    row = app.selected_cells(1);
          
                    missing_matrix(row,:)=[];
                    var_filename = 'ws_missing_coordinates.mat';
                    save(var_filename, 'missing_matrix');
                    app.CoordinatesTable.Data= missing_matrix;
                end
 end
 

 if(size(missing_matrix,1)==0)
     delete('ws_missing_coordinates.mat');
 end
 
end

