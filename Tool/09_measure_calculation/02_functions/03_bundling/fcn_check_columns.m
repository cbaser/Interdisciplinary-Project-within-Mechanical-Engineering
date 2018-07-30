function [ result ] = fcn_check_columns( same_value_matrix,finish_lane,vehicle,engine_design,engine_specification,engine_volume,engine_power,engine_torque )
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
    
    if(strcmp(unique_vehicle_matrix(:,engine_design),'null') & ... 
            strcmp(unique_vehicle_matrix(:,engine_specification),'null') & ...
        strcmp(unique_vehicle_matrix(:,engine_volume),'null'))


        a_new_measure = fcn_attributes_iteration(unique_vehicle_matrix,vehicle_matrix,finish_lane,a_new_measure);
        canBeBundled = fcn_is_bundled(a_new_measure);
       if(canBeBundled)
            fcn_add_measure_to_database(a_new_measure);
            result=1;
       end
    else
        %Dividing Motor-Bauform
        unique_engine_design = fcn_find_uniques(unique_vehicle_matrix,engine_design);    
        for i=1:size(unique_engine_design,1)

            engine_design_matrix = fcn_build_unique_matrix(unique_vehicle_matrix,unique_engine_design{i,1},engine_design);
            %Dividing Motor-Spezifikation
            unique_engine_specification = fcn_find_uniques(engine_design_matrix,engine_specification);

            for j=1:size(unique_engine_specification,1)
                engine_specification_matrix = fcn_build_unique_matrix(engine_design_matrix,unique_engine_specification{j,1},engine_specification);


                unique_engine_volume = fcn_find_uniques(engine_specification_matrix,engine_volume);

                for k=1:size(unique_engine_volume,1)
                    %Dividing Motor-Hubraum
                    engine_volume_matrix = fcn_build_unique_matrix(engine_specification_matrix,unique_engine_volume{k,1},engine_volume);
                    
                    unique_engine_power = fcn_find_uniques(engine_volume_matrix,engine_power);
                    
                    for p=1:size(unique_engine_power,1)
                        %Dividing Motor-Leistung
                        engine_power_matrix = fcn_build_unique_matrix(engine_volume_matrix,unique_engine_power{p,1},engine_power);
                        
                        unique_engine_torque=fcn_find_uniques(engine_power_matrix,engine_torque);
                        
                       for t=1:size(unique_engine_torque,1)
                           engine_torque_matrix = fcn_build_unique_matrix(engine_power_matrix,unique_engine_torque{t,1},engine_torque);
                           %Dividing Motor-Drehmoment
                           engine_matrix = fcn_build_specific_engine_matrix(vehicle_matrix,unique_engine_design{i,1},engine_design,unique_engine_specification{j,1},engine_specification,unique_engine_volume{k,1},engine_volume,unique_engine_power{p,1},engine_power,unique_engine_torque{t,1},engine_torque);               
                    
                          a_new_measure = fcn_attributes_iteration(engine_torque_matrix,engine_matrix,finish_lane,a_new_measure);
                            canBeBundled = fcn_is_bundled(a_new_measure);
                            if(canBeBundled)
                                fcn_add_measure_to_database(a_new_measure);
                                result=1;
                            end 
                       end
                       
                        
                    end
                    
                    
                    
                    
                    
                    
                  

                end


            end

        end
    end
  
end

end




