function [ out ] = fcn_compare_coordinates( ind1,ind2)
%this function gets array of row indexes and compares them according the
%converted coordinates
%Sends the information that into build combination matrix function that value is coming from missing coordinates part
%Checks which type of missing coordinate and existing coordinate pair is
%coming from input and compares either converted coordinates or converted
%database
load('ws_calculation_parts.mat');
load('ws_coordinates_converted.mat');
load('ws_database_converted.mat');
load('ws_compared_indexes_coordinates');

row1 = indexes_coordinates(ind1,1);
row2 = indexes_coordinates(ind2,2);
out=1;
for col=1:size(converted_arr,2)
    if(~contains(parts{1,1},'_') && ~contains(parts{1,2},'_'))
            if(converted_coordinates(row1,col) ~= converted_coordinates(row2,col))
                  if(converted_coordinates(row1,col) ~=0 && converted_coordinates(row2,col)~=0)      
                      out = 0;
                  end

            end
     end
     
     if(~contains(parts{1,1},'_') && contains(parts{1,2},'_'))
            
            if(converted_coordinates(row1,col) ~= converted_arr(row2,col))
                  if(converted_coordinates(row1,col) ~=0 && converted_arr(row2,col)~=0)      
                      out = 0;
                  end

            end
     end
     if(contains(parts{1,1},'_') && ~contains(parts{1,2},'_'))
         if(converted_arr(row1,col) ~= converted_coordinates(row2,col))
                  if(converted_arr(row1,col) ~=0 && converted_coordinates(row2,col)~=0)      
                      out = 0;
                  end

         end
     end
      if(contains(parts{1,1},'_') && contains(parts{1,2},'_'))     
          load('ws_measures.mat');
          if(~contains(measure_cells{1,1},'B'))
                     if(converted_arr(row1,col) ~= converted_coordinates(row2,col))
                              if(converted_arr(row1,col) ~=0 && converted_coordinates(row2,col)~=0)      
                                  out = 0;
                              end
                     end    
                 else
                      if(converted_coordinates(row1,col) ~= converted_arr(row2,col))
                          if(converted_coordinates(row1,col) ~=0 && converted_arr(row2,col)~=0)      
                              out = 0;
                          end
                      end
                 end
          end
      end
end
