function [ ] = fcn_save_database( )

%Connecting to database according from file opener
[db_fileName,db_filePath] = uigetfile('*.db','Select SQLite database to file to save');
db_full_file =strcat(db_filePath,db_fileName);
db_url= ['jdbc:sqlite:' db_full_file];

conn = database('','','','org.sqlite.JDBC',db_url);
curs = exec(conn, 'PRAGMA table_info(Maß); ');
rs = fetch(curs);
colNames = rs.Data;
colNames = colNames(:,2);
validNames = matlab.lang.makeValidName(colNames, 'ReplacementStyle', 'hex');
%sending the full matrix into database
load('ws_full_matrix.mat');
originalNames = regexprep(validNames, '0x([\dA-F]{2})', '${char(hex2dec($1))}');
insert(conn, 'Maß', originalNames, full_matrix);

close(conn);

msgbox('Werte in Datenbank hinzugefügt!');
fcn_clean_up();

end

