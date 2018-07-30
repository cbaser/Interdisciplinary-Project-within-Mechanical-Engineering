function [  ] = fcn_set_attribute_type( attribute_type )
%keeping the attribute type
fcn_jump_to_path('fcn_set_attribute_type');
         var_filename = 'ws_attribute_type.mat';
        save(var_filename, 'attribute_type');

end

