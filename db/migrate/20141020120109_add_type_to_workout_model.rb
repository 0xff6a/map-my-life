class AddTypeToWorkoutModel < ActiveRecord::Migration
  def change
    add_column :workouts, :type, :string
  end
end
