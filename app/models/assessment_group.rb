class AssessmentGroup < ApplicationRecord
  has_many :assessments

  # check if indiv assessments is at risk
  def check_high_risk
    assessments.each do |i|
      if i.high_risk?
        return true
      end
    end
  end

end
