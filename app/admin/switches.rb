ActiveAdmin.register Switch do
  actions :all

  permit_params :is_active

  index do
    column :is_active do |request|
      request.switch.is_active
    end
  end

end
