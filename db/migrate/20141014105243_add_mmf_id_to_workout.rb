class AddMmfIdToWorkout < ActiveRecord::Migration
  def change
    add_column :workouts, :mmf_id, :integer
  end
end
