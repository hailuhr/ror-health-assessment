class CreateAssessmentGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :assessment_groups do |t|
      t.string :name
      t.timestamps
    end
  end
end
