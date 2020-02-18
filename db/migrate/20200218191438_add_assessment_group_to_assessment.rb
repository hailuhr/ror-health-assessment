class AddAssessmentGroupToAssessment < ActiveRecord::Migration[6.0]
  def change
    add_column :assessments, :assessment_group_id, :integer
  end
end
