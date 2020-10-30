class Request < ApplicationRecord
    # validates :user_id, presence: true

    belongs_to :user
    belongs_to :institution
    belongs_to :education_program
    belongs_to :department
    belongs_to :language
    belongs_to :subject
end
