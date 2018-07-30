function [  ] = fcn_calculation_mc(component,firstDimension,secondDimension)


%firstPart_First={};
%firstPart_Second={};
%secondPart_First={};
%secondPart_Second={};
load('ws_database_raw.mat');

%converted database is created from original database values but with
%numbers according their attribute indexess for future use
fcn_build_converted_database();
%Missing coordinates array is also converted with same logic for further use 
fcn_convert_coordinates();
%Every point of has underscore (' _ ') value, first it is split from point
%name
 firstPart_First = firstDimension{1,1}(1:end-2);
    secondPart_First = firstDimension{1,1}(end-1:end);
    
    firstPart_Second = secondDimension{1,1}(1:end-2);
    secondPart_Second = secondDimension{1,1}(end-1:end);

    if(strcmp(component,firstPart_First) || strcmp(component,firstPart_Second))
        return;
    end
    

 if(~strcmp(firstDimension,'Kennzeichentrager') && ...
                  ~strcmp(secondDimension,'Radplatte')&& ...
                  ~strcmp(secondDimension,'Pedal')&& ... 
                  ~strcmp(secondDimension,'Abtrieb')&&...
                  ~contains(firstDimension,'B')&&...
                  ~contains(secondDimension,'B'))
              %If incoming coordinates are not missing coordinates
              %we keep the component name for future use (BX12a for
              %example)
              fcn_keep_component(component);
              %we keep that parts of coordinates either _1 or _2
              fcn_keep_parts(secondPart_First,secondPart_Second);
              %we keep which types of coordinates we have
              fcn_find_indices(database_raw,firstPart_First,firstPart_Second);

 else 
     fcn_keep_component(component);
     %If incoming coordinates are missing coordinates and both of them
     %does not contain _ string
     %we keep the component name for future use (BX12a for example)
     %and we are searching them in missing coordinates array
     if(~contains(firstDimension,'_') && ~contains(secondDimension,'_'))
         fcn_keep_parts(firstDimension,secondDimension);
         fcn_find_coordinate_indices(database_raw,firstDimension,secondDimension);
     end
     
     if(~contains(firstDimension,'_') && contains(secondDimension,'_'))
         %If incoming coordinates are missing coordinates and one of them
         %does not contain _ string
         %we keep the component name for future use (BX12a for example)
         %and we are searching one of them in database other in missing coordinates array
         fcn_keep_parts(firstDimension,secondPart_Second);
         fcn_find_coordinate_indices(database_raw,firstDimension,firstPart_Second);
     end
     if(contains(firstDimension,'_')   && ~contains(secondDimension,'_'))
         %If incoming coordinates are missing coordinates and one of them
         %does not contain _ string
         %we keep the component name for future use (BX12a for example)
         %and we are searching one of them in database other in missing coordinates array
          fcn_keep_parts(secondPart_First,secondDimension);
          fcn_find_coordinate_indices(database_raw, firstPart_First,secondDimension);
     end
     if(contains(firstDimension,'_') && contains(secondDimension,'_'))
         %If incoming coordinates are missing coordinates and two of them
         %contain _ string
         %we keep the component name for future use (BX12a for example)
         %and we are searching both of them in missing coordinates array
         fcn_keep_component(component);
         fcn_keep_parts(secondPart_First,secondPart_Second);
         fcn_find_coordinate_indices(database_raw,firstPart_First,firstPart_Second);
     end
 end
end


