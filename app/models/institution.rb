class Institution < ApplicationRecord
    has_one :request
    belongs_to :city
    belongs_to :institution_type
end
