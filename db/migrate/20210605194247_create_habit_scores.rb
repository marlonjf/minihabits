class CreateHabitScores < ActiveRecord::Migration[6.1]
  def change
    create_table :habit_scores do |t|
      t.references :habit, index: true, foreign_key: true

      t.timestamps
    end
  end
end
