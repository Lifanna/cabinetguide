class HomeController < ApplicationController
  def index
    @user = User.new
    @request = Request.new

    @regions = get_regions
    @institution_types = get_institution_types
    @education_forms = get_education_forms
    @departments = get_departments
    @languages = get_languages
  end

  def request_form
    # user = User.new(
    #   params[:request][:first_name],
    #   params[:request][:last_name],
    #   params[:request][:email],
    #   params[:request][:phone],
    # )
    save_successful = false

    if (Switch.first.is_active == false)
      return
    end

    Request.transaction do
      # @user = User.find_or_create_by(
      #   first_name: params[:request][:first_name],
      #   last_name: params[:request][:last_name],
      #   email: params[:request][:email],
      #   phone: params[:request][:phone]
      # )
      
      # user.email = params[:request][:email]
      # user.phone = params[:request][:phone]

      @user = User.new
      @request = Request.new
      # if !verify_rucaptcha?
      #   @request.errors.add(:base, 'Неверно введен код с картинки')
      #   puts "CODE PROBLEM:  #{@request.errors}"
      #   # render 'index'
      #   raise ActiveRecord::Rollback
      # end

      # if @user.valid?
      @request.institution_id = params[:request][:institution]
      @request.education_program_id = params[:request][:education_program]
      @request.department_id = params[:request][:department]
      @request.education_form_id = params[:request][:education_form]
      @request.language_id = params[:request][:language]
      @request.subject_id = params[:request][:subject]
      @request.question = params[:request][:question]
      @user = User.find_or_create_by(
        first_name: params[:request][:first_name],
        last_name: params[:request][:last_name],
        email: params[:request][:email],
        phone: params[:request][:phone]
      )
      @request.user = @user
        # @user.save
      # end

      # saved = @request.save
      unless @request.save
        @request.errors.add(:base, 'Не заполнены необходимые поля')
        @request.errors.full_messages.each {|error|
          puts "FFFFFF:               #{error}"
        }
        raise ActiveRecord::Rollback
        # render 'index'
      end

      save_successful = true
    end

    if save_successful
      redirect_to action: 'success'
    else
      render 'index'
    end
  end

  def success
    
  end

  def get_cities_by_region
    @cities = City.where(region_id: params[:region])

    render json: @cities
  end

  def get_regions
    @regions = Region.all
  end

  def get_languages
    @languages = Language.all
  end

  def get_education_forms
    @edu_forms = EducationForm.all
  end

  def get_institution_types
    @institution_types = InstitutionType.all
  end

  def get_institutions
    @institutions = Institution.select('DISTINCT(name), *').where(city_id: params[:city], institution_type_id: params[:institution_type]).order("institutions.name ASC")
    @subjects = Subject.where(institution_type_id: params[:institution_type])

    render json: {
      "institutions": @institutions,
      "subjects": @subjects
    }
  end

  def get_education_programs
    @edu_programs = EducationProgram.where(education_form_id: params[:education_form])
    
    render json: @edu_programs
  end

  def get_departments
    @departments = Department.order("name ASC").all
  end

  private
    def request_params
      params.require(:request).permit(
        :first_name,
        :last_name,
        :email,
        :phone,
        :region,
        :city,
        :institution_type,
        :institution,
        :education_form,
        :education_program,
        :subject,
        :language,
        :department,
        :question,
      )
    end
end
