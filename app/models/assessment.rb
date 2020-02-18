class Assessment < ApplicationRecord
  belongs_to :patient
  belongs_to :questionnaire
  belongs_to :assessment_group

  has_many :patients_answers

  validates_presence_of :date, :assessment_name

  def save_score
    calculation = questionnaire.calculate_score(patients_answers)

    self.update(score: calculation)
  end

  # phq9 score 15 >
  def high_risk?
    if questionnaire.questionnaire_type == "PHQ"
      score > 15
    else
      nil
    end
  end
end
