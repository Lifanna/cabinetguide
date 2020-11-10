class Request < ApplicationRecord
    # validates :user_id, presence: true

    belongs_to :user, :inverse_of => :request
    belongs_to :institution, optional: true
    belongs_to :education_program, optional: true
    belongs_to :department, optional: true
    belongs_to :language, optional: true
    belongs_to :subject, optional: true
end
