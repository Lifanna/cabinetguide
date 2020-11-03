class InstitutionType < ApplicationRecord
    has_many :institutions
    has_many :subjects
end
