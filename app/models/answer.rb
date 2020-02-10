class Answer < ApplicationRecord
  belongs_to :question
  has_many :patients_answers


  def questionnaire
    question.questionnaire
  end
end
