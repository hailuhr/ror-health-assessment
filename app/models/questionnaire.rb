class Questionnaire < ApplicationRecord
  has_many :questions
  has_many :answers, through: :questions
  has_many :assessments

  validates_presence_of :name

  def questionnaire_type
    case name
      when "Patient Health Questionnaire"
        "PHQ"
      when "Sheehan Disability Scale"
        "SDS"
      when "SIB"
        "SIB"
      end
  end

  def calculate_score(patients_answers)
    if questionnaire_type == "PHQ"
      calculate_phq_questionnaire(patients_answers)
    elsif questionnaire_type == "SDS"
      calculate_sds_questionnaire(patients_answers)
    else
      Null
    end
  end

  def calculate_phq_questionnaire(patients_answers)
    score = 0
    patients_answers.each do |pa|
      score += pa.answer.value.to_i
    end

    score
  end

  def calculate_sds_questionnaire(patients_answers)
    global_function_impairment = 0
    days_lost = 0
    days_unproductive = 0

    patients_answers.each do |pa|
      answer = pa.answer
      value = answer.value.to_i
      global_function_impairment += value
    end

    global_function_impairment
  end
end
