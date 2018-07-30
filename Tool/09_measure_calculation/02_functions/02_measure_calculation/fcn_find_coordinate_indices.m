function [  ] = fcn_find_coordinate_indices( database,firstDimension,secondDimension )
load('ws_missing_coordinates.mat');
load('ws_calculation_parts.mat');
%That function basically searches entire missing coordinates array with the type of missing coordinate 
%and saves corresponding row numbers into new array
%For example License plate is in 1st row to 5 th (5 entries) row and EX11 is 6th to 7th (2 entries) row
%Function basically check which coordinate has more entries and creates an
%array with the same size of bigger entries ( 5 in our example).
%and fills with the array with index numbers such as : [1,2,3,4,5 ; 6 , 7]




indexes_str1=[];
indexes_str2=[];
indexes_coordinates=[];

bigOrSmall = 0;
    if(~contains(parts{1,1},'_') && ~contains(parts{1,2},'_'))
         [row_1,~] = ind2sub(size(missing_matrix),find(cellfun(@(x)strcmp(x,parts{1,1}),missing_matrix)));
               indexes_str1=[indexes_str1 ; row_1];
                
         [row_2,~] = ind2sub(size(missing_matrix),find(cellfun(@(x)strcmp(x,parts{1,2}),missing_matrix)));
               indexes_str2=[indexes_str2;row_2];
     end
     
     if(~contains(parts{1,1},'_') && contains(parts{1,2},'_'))
         [row_1,~] = ind2sub(size(missing_matrix),find(cellfun(@(x)strcmp(x,firstDimension),missing_matrix)));
               indexes_str1=[indexes_str1 ; row_1];
                
         [row_2,~] = ind2sub(size(database),find(cellfun(@(x)strcmp(x,secondDimension),database)));
               indexes_str2=[indexes_str2;row_2];
     end
     if(contains(parts{1,1},'_') && ~contains(parts{1,2},'_'))
         
         [row_1,~] = ind2sub(size(database),find(cellfun(@(x)strcmp(x,firstDimension),database)));
               indexes_str1=[indexes_str1 ; row_1];
                
         [row_2,~] = ind2sub(size(missing_matrix),find(cellfun(@(x)strcmp(x,secondDimension),missing_matrix)));
               indexes_str2=[indexes_str2;row_2];
     end
     if(contains(parts{1,1},'_')&& contains(parts{1,2},'_'))
         fcn_keep_measures(firstDimension,secondDimension);
         searchedString='';
         
         
        switch secondDimension
            case 'BX114'
                %searchedString = 'SQT';
                searchedString='BX114';
                [row_1,~] = ind2sub(size(database),find(cellfun(@(x)strcmp(x,firstDimension),database)));
                indexes_str1=[indexes_str1 ; row_1];                
                [row_2,~] = ind2sub(size(missing_matrix),find(cellfun(@(x)strcmp(x,searchedString),missing_matrix)));
                indexes_str2=[indexes_str2;row_2];
            case 'BX15b'
                %searchedString = 'Exhaust';
                searchedString='BX15b';
                [row_1,~] = ind2sub(size(database),find(cellfun(@(x)strcmp(x,firstDimension),database)));
                indexes_str1=[indexes_str1 ; row_1];
                
                [row_2,~] = ind2sub(size(missing_matrix),find(cellfun(@(x)strcmp(x,searchedString),missing_matrix)));
                indexes_str2=[indexes_str2;row_2];
            case 'BX19c'
                %searchedString = 'BKV';
                searchedString='BX19c';
                [row_1,~] = ind2sub(size(database),find(cellfun(@(x)strcmp(x,firstDimension),database)));
                indexes_str1=[indexes_str1 ; row_1];
                
                [row_2,~] = ind2sub(size(missing_matrix),find(cellfun(@(x)strcmp(x,searchedString),missing_matrix)));
                indexes_str2=[indexes_str2;row_2];
            case 'BX119a'
                %searchedString ='Getriebeflansch';
                searchedString='BX119a';
                [row_1,~] = ind2sub(size(database),find(cellfun(@(x)strcmp(x,firstDimension),database)));
                indexes_str1=[indexes_str1 ; row_1];
                
                [row_2,~] = ind2sub(size(missing_matrix),find(cellfun(@(x)strcmp(x,searchedString),missing_matrix)));
                indexes_str2=[indexes_str2;row_2];
            case 'BY13d'
             %   searchedString='Abgasanlage';
                searchedString='BY13d';
                [row_1,~] = ind2sub(size(database),find(cellfun(@(x)strcmp(x,firstDimension),database)));
                indexes_str1=[indexes_str1 ; row_1];
                
                [row_2,~] = ind2sub(size(missing_matrix),find(cellfun(@(x)strcmp(x,searchedString),missing_matrix)));
                indexes_str2=[indexes_str2;row_2];
        end
        switch firstDimension
            case 'BX15b'
           %   searchedString = 'Exhaust';  
               searchedString = 'BX15b';
                [row_1,~] = ind2sub(size(missing_matrix),find(cellfun(@(x)strcmp(x,searchedString),missing_matrix)));
                indexes_str1=[indexes_str1 ; row_1];
                
                [row_2,~] = ind2sub(size(database),find(cellfun(@(x)strcmp(x,secondDimension),database)));
                indexes_str2=[indexes_str2;row_2];
            case 'BX115'
               % searchedString = 'CMS';
                 searchedString ='BX115';
                [row_1,~] = ind2sub(size(missing_matrix),find(cellfun(@(x)strcmp(x,searchedString),missing_matrix)));
                indexes_str1=[indexes_str1 ; row_1];
                
                [row_2,~] = ind2sub(size(database),find(cellfun(@(x)strcmp(x,secondDimension),database)));
                indexes_str2=[indexes_str2;row_2];
        end
        
        
                
        
     end
     
     

if( length(indexes_str1) > length(indexes_str2))
    
    indexes_coordinates = zeros(length(indexes_str1),2);
else
    indexes_coordinates = zeros(length(indexes_str2),2);
    bigOrSmall=1;
end
if ( bigOrSmall == 1)
    for i=1:length(indexes_str1)
    indexes_coordinates(i,1) = indexes_str1(i,1);
    end
    indexes_coordinates(:,2) = indexes_str2;
else
     for i=1:length(indexes_str2)
    indexes_coordinates(i,2) = indexes_str2(i,1);
     end
    indexes_coordinates(:,1) = indexes_str1;
end


if(size(indexes_coordinates,1)==0)
    return;
end
fcn_jump_to_path('fcn_find_coordinate_indices');
 var_filename = 'ws_compared_indexes_coordinates.mat';
save(var_filename, 'indexes_coordinates');
fcn_check_coordinates();
end

