class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.text :type
      t.string :date
      t.decimal :duration
      t.string :intensity

      t.timestamps
    end
  end
end
