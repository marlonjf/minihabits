class CreateGoals < ActiveRecord::Migration[6.1]
  def change
    create_table :goals do |t|
      t.string :name
      t.integer :target_value
      t.string :target_unit
      t.date :deadline
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
