function result = fcn_rebundling_sub_iteration(same_value_matrix,vehicle,finish_lane,engine_design,engine_specification,engine_volume)
result=0;
if(size(same_value_matrix,1)==1)
    fcn_add_measure_to_database(same_value_matrix);
    result =1;
    return;
end

a_new_measure= cell(1,size(same_value_matrix,2));
a_new_measure(1,1:10) = same_value_matrix(end,1:10);
a_new_measure(1,finish_lane:end)= same_value_matrix(end,finish_lane:end);

unique_vehicle = fcn_find_uniques(same_value_matrix,vehicle);

    for v=1:size(unique_vehicle)
         vehicle_matrix = fcn_build_vehicle_matrix(unique_vehicle{v,1});  

         unique_vehicle_matrix = fcn_build_unique_matrix(same_value_matrix,unique_vehicle{v,1},vehicle);

              if(fcn_check_equal_uniques(unique_vehicle_matrix,vehicle_matrix,engine_design))
                 for u=1:size(unique_vehicle_matrix,1)
                     unique_vehicle_matrix{u,engine_design}='null';  
                 end            

              end

              if(fcn_check_equal_uniques(unique_vehicle_matrix,vehicle_matrix,engine_specification))
                  for u=1:size(unique_vehicle_matrix,1)
                     unique_vehicle_matrix{u,engine_specification}='null';  
                 end

              end
              if(fcn_check_equal_uniques(unique_vehicle_matrix,vehicle_matrix,engine_volume))
                   for u=1:size(unique_vehicle_matrix,1)
                     unique_vehicle_matrix{u,engine_volume}='null';  
                   end

              end

              a_new_measure = fcn_attributes_iteration(unique_vehicle_matrix,vehicle_matrix,finish_lane,a_new_measure);
              canBeBundled = fcn_is_bundled(a_new_measure);
               if(canBeBundled)
                    fcn_add_measure_to_database(a_new_measure);
                    result=1;
               end
       end
         
 end


   
