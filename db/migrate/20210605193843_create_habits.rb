class CreateHabits < ActiveRecord::Migration[6.1]
  def change
    create_table :habits do |t|
      t.string :name
      t.belongs_to :goal, index: true, foreign_key: true

      t.timestamps
    end
  end
end
