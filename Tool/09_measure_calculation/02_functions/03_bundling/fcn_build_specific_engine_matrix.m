function [ engine_matrix ] = fcn_build_specific_engine_matrix( vehicle_matrix,motor_design,design_index,motor_specification,specification_index,motor_volume,volume_index,motor_power,power_index,motor_torque,torque_index )
%divide vehicle matrix into incoming specific motor design value
motor_design_matrix = fcn_build_unique_matrix(vehicle_matrix,motor_design,design_index);
%divide motor design matrix into incoming specific motor specification value
 motor_specification_matrix = fcn_build_unique_matrix(motor_design_matrix,motor_specification,specification_index);
 %divide motor specification matrix into incoming specific motor volume value
 motor_volume_matrix = fcn_build_unique_matrix(motor_specification_matrix,motor_volume,volume_index);
 
 if(strcmp(motor_power,'null') && strcmp(motor_torque,'null'))
%If motor power and motor torque are null, all values are taken
   engine_matrix = motor_volume_matrix;
 else
     if(~strcmp(motor_power,'null'))
         %if not, that specific value (for example 470 kW ) and null values
         %are together taken
         motor_power_matrix = fcn_build_unique_matrix_with_null(motor_volume_matrix,motor_power,power_index);
         engine_matrix = motor_power_matrix;
         if(~strcmp(motor_torque,'null'))
             motor_torque_matrix = fcn_build_unique_matrix_with_null(motor_power_matrix,motor_torque,torque_index);
             engine_matrix = motor_torque_matrix;
             
         end
         
         
         
     end
 
 
 end
 

end

