class Subject < ApplicationRecord
    has_many :requests
    belongs_to :institution_type
end
