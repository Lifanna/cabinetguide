ActiveAdmin.register User do
    config.xls_builder.i18n_scope = [:activerecord, :attributes, :user]
    permit_params :first_name, :last_name, :email, :phone
    config.xls_builder.header_format = { weight: :bold,
        color: :blue }

    config.xls_builder.delete_columns :id, :created_at, :updated_at
end
