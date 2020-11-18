ActiveAdmin.register Institution do
    permit_params :name, :institution_type_id, :city_id, :isDeleted
    actions :all
end
