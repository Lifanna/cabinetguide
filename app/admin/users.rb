ActiveAdmin.register User do
    config.xls_builder.i18n_scope = [:activerecord, :attributes, :user]
    permit_params :all
    config.xls_builder.header_format = { weight: :bold,
        color: :blue }

    config.xls_builder.delete_columns :id, :created_at, :updated_at
end
