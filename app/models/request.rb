class Request < ApplicationRecord
    validates :user_id, presence: true

    belongs_to :user, :inverse_of => :request
    belongs_to :institution, optional: true
    belongs_to :education_program, optional: true
    belongs_to :department, optional: true
    belongs_to :language, optional: true
    belongs_to :subject, optional: true

    before_save :default_values

    def default_values
        self.institution_id ||= 1
        self.education_program_id ||= 1
        self.department_id ||= 30
        self.education_form_id ||= 7
        self.language_id ||= 2
        self.subject_id ||= 1
    end
end
