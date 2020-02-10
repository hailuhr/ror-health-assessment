class CreateSubsets < ActiveRecord::Migration[6.0]
  def change
    create_table :subsets do |t|
      t.string :subset_text
      t.integer :question_id
    end
  end
end
