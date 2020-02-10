class Patient < ApplicationRecord
  has_many :assessments
  has_many :patients_answers
end
