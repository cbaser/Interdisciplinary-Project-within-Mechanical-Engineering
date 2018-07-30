function  []  = fcn_find_indices( database,string_1,string_2 )
%That function basically searches entire database 
%and saves corresponding row numbers into new array
%For example EX11 is in 1st row to 5 th (5 entries) row and EX12 is 6th to 7th (2 entries) row
%Function basically check which coordinate has more entries and creates an
%array with the same size of bigger entries ( 5 in our example).
%and fills with the array with index numbers such as : [1,2,3,4,5 ; 6 , 7]


indexes_str1=[];
indexes_str2=[];
indexes=[];
bigOrSmall = 0;
fcn_build_converted_database();
[row_1,~] = ind2sub(size(database),find(cellfun(@(x)strcmp(x,string_1),database)));
                indexes_str1=[indexes_str1 ; row_1];
                
[row_2,~] = ind2sub(size(database),find(cellfun(@(x)strcmp(x,string_2),database)));
                indexes_str2=[indexes_str2;row_2];

if( length(indexes_str1) > length(indexes_str2))
    
    indexes = zeros(length(indexes_str1),2);
else
    indexes = zeros(length(indexes_str2),2);
    bigOrSmall=1;
end
if ( bigOrSmall == 1)
    for i=1:length(indexes_str1)
    indexes(i,1) = indexes_str1(i,1);
    end
    indexes(:,2) = indexes_str2;
else
     for i=1:length(indexes_str2)
    indexes(i,2) = indexes_str2(i,1);
     end
    indexes(:,1) = indexes_str1;
end
if(size(indexes,1)==0)
    return;
end

%saving the indexes for future use
fcn_jump_to_path('fcn_find_indices');
var_filename = 'ws_compared_indexes.mat';
save(var_filename, 'indexes');
fcn_check_numbers();


