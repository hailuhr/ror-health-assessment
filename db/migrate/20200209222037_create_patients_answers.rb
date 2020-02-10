class CreatePatientsAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :patients_answers do |t|
      t.integer :patient_id
      t.integer :answer_id
      t.integer :assessment_id
    end
  end
end
