function [ first_Bundling ] = fcn_is_bundled( a_new_measure )
%Checks that a new measure has no empty columns and can be added to database
  first_Bundling=1;
                    for m=1:size(a_new_measure,2)
                        if(isempty(a_new_measure{1,m}))
                            first_Bundling=0;
                            break;
                        end
                    end         

end

