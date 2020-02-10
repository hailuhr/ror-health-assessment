class CreateQuestionnaires < ActiveRecord::Migration[6.0]
  def change
    create_table :questionnaires do |t|
      t.string :name
      t.integer :assessment_id
    end
  end
end
