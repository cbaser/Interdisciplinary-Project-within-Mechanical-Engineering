function [ result ] = fcn_check_equal_uniques( incoming_matrix,basis_matrix,index )
%that function basically checks the unique values for that specific column
%index and compares them if they are same or not
%sometimes at basis matrix 'null' is extra, that case is checked as well
result =0;
 unq_incoming_matrix = fcn_find_uniques(incoming_matrix,index);
 unq_basis_matrix = fcn_find_uniques(basis_matrix,index);
 
 
        if(isequal(unq_incoming_matrix,unq_basis_matrix))
                result=1;
            else
                for k=1:size(unq_basis_matrix,1)
                    if(strcmp(unq_basis_matrix{k,1},'null'))
                        unq_basis_matrix(k,:)=[];
                    end
                end
                if(isequal(unq_incoming_matrix,unq_basis_matrix))
                result=1;
                end

        end

end

