class Assessment < ApplicationRecord
  belongs_to :patient
  belongs_to :questionnaire
  belongs_to :assessment_group

  has_many :patients_answers

  validates_presence_of :date, :assessment_name

  def high_risk?
    if questionnaire.questionnaire_type == "PHQ"
      score && score > 15
    end
  end

  def save_score
    calculation = questionnaire.calculate_score(patients_answers)

    self.update(score: calculation)
  end
end
