ActiveAdmin.register Subject do
    permit_params :name, :institution_type_id, :isDeleted
end
