class Assessment < ApplicationRecord
  belongs_to :patient
  belongs_to :questionnaire

  has_many :patients_answers

  validates_presence_of :date, :assessment_name

  def save_score
    calculation = questionnaire.calculate_score(patients_answers)

    self.update(score: calculation)
  end
end
