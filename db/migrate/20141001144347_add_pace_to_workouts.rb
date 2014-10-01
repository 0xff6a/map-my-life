class AddPaceToWorkouts < ActiveRecord::Migration
  def change
    add_column :workouts, :pace, :decimal
  end
end
