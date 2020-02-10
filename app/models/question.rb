class Question < ApplicationRecord
  has_many :answers
  belongs_to :questionnaire
  belongs_to :subset

end
