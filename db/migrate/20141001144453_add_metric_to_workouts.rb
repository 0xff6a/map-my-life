class AddMetricToWorkouts < ActiveRecord::Migration
  def change
    add_column :workouts, :metric, :string
  end
end
