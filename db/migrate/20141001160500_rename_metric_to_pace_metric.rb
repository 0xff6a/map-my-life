class RenameMetricToPaceMetric < ActiveRecord::Migration
  def change
    rename_column :workouts, :metric, :pace_metric
  end
end
