class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.boolean :active, default: true
      t.integer :subset_id
      t.integer :questionnaire_id
      t.string :question_type
      t.string :question_text
    end
  end
end
