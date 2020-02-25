class AssessmentGroup < ApplicationRecord
  has_many :assessments

  validates_presence_of :name

  def check_high_risk
    assessments.any?{ |i| i.high_risk? } 
  end
end
