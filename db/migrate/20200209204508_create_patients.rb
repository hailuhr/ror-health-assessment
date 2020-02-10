class CreatePatients < ActiveRecord::Migration[6.0]
  def change
    create_table :patients do |t|
      t.datetime :date_of_birth
      t.string :first_name
      t.string :last_name
    end
  end
end
