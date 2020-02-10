class CreateAssessments < ActiveRecord::Migration[6.0]
  def change
    create_table :assessments do |t|
      t.integer :score
      t.integer :patient_id
      t.integer :questionnaire_id
      t.string :assessment_name
      t.datetime :date
      t.string :notes
    end
  end
end
