ActiveAdmin.register Request do
  actions :all

  index do
    column :first_name do |request|
      request.user.first_name
    end
    column :last_name do |request|
      request.user.last_name
    end
    column :email do |request|
      request.user.email
    end
    column :phone do |request|
      request.user.phone
    end
    column :city do |request|
      request.institution.city.name
    end
    column :institution_type do |request|
      request.institution.institution_type.name
    end
    column :institution do |request|
      request.institution.name
    end
    column :education_program do |request|
      request.education_program.name
    end
    column :education_form do |request|
      request.education_program.education_form.name
    end
    column :department do |request|
      request.department.name
    end
    column :language do |request|
      request.language.name
    end
    column :subject do |request|
      request.subject.name
    end
    column :question do |request|
      request.question
    end
  end

  config.xls_builder.i18n_scope = [:activerecord, :attributes, :request]
  config.xls_builder.header_format = { weight: :bold, color: :blue }

  # config.xls_builder.only_columns :first_name,
  # :last_name,
  # :email,
  # :phone,
  # :city,
  # :institution_type,
  # :institution,
  # :education_program,
  # :education_form,
  # :department,
  # :language,
  # :subject,
  # :question
  
  config.xls_builder.column('first_name') do |request|
    request.user.first_name
  end

  config.xls_builder.column('last_name') do |request|
    request.user.last_name
  end

  config.xls_builder.column('email') do |request|
    request.user.email
  end

  config.xls_builder.column('phone') do |request|
    request.user.phone
  end
  
  config.xls_builder.column('city') do |request|
    request.institution.city.name
  end
  
  config.xls_builder.column('institution_type') do |request|
    request.institution.institution_type.name
  end
  
  config.xls_builder.column('institution') do |request|
    request.institution.name
  end
  
  config.xls_builder.column('education_program') do |request|
    request.education_program.name
  end

  config.xls_builder.column('education_form') do |request|
    request.education_program.education_form.name
  end
  
  config.xls_builder.column('department') do |request|
    request.department.name
  end

  config.xls_builder.column('language') do |request|
    request.language.name
  end

  config.xls_builder.column('subject') do |request|
    request.subject.name
  end

  config.xls_builder.column('question') do |request|
    request.question
  end

  config.xls_builder.delete_columns :id, :created_at, :updated_at, :isDeleted, :question

      # Request.column_names.each do |c|
      #   column c.to_sym
      # end

  # permit_params :question

  # action_item :add do
  #   link_to "Add Event", '/', method: :post
  # end
  
  # index do
    # # define your columns

    # # now define the links...
    # column :links do |resource|
      # links = ''.html_safe
      # if controller.action_methods.include?('show') and controller.current_ability.can?(:read, resource)
        # links += link_to I18n.t('active_admin.view'), resource_path(resource), :class => "member_link view_link"
      # end
      # if controller.action_methods.include?('edit') and controller.current_ability.can?(:edit, resource)
        # links += link_to I18n.t('active_admin.edit'), edit_resource_path(resource), :class => "member_link edit_link"
      # end
      # if controller.action_methods.include?('destroy') and controller.current_ability.can?(:destroy, resource)
        # links += link_to I18n.t('active_admin.delete'), resource_path(resource), :method => :delete, :confirm => I18n.t('active_admin.delete_confirmation'), :class => "member_link delete_link"
      # end
      # links
    # end
  # end

end
