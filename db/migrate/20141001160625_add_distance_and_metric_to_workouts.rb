class AddDistanceAndMetricToWorkouts < ActiveRecord::Migration
  def change
    add_column :workouts, :distance, :decimal
    add_column :workouts, :distance_metric, :string
  end
end
