function [database_raw] = fcn_load_database()
%uigetfile opens a selection window to select to database
[db_fileName,db_filePath] = uigetfile('*.db','Select SQLite database file to load');
db_full_file_path =strcat(db_filePath,db_fileName);
%find where the exact file path is as db_full_file_path.
db_url= ['jdbc:sqlite:' db_full_file_path];
conn = database('','','','org.sqlite.JDBC',db_url);
%Database connection is set.
curs = exec(conn, 'SELECT * FROM Maß');
rs = fetch(curs);
%Execute the query and set it into database_raw
database_raw = rs.Data;

close(conn);
fcn_jump_to_path('fcn_load_database');
var_filename = 'ws_database_raw.mat';
save(var_filename, 'database_raw');
if(size(database_raw,1)>1)
fcn_build_converted_database();
else
    msgbox('Bitte wahlen Sie eine Datenbank!');
    
end

end

