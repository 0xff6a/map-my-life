class AddAttributesToTarget < ActiveRecord::Migration
  def change
    add_column :targets, :pace, :decimal
    add_column :targets, :pace_metric, :string
    add_column :targets, :distance, :decimal
    add_column :targets, :distance_metric, :string
    add_column :targets, :due_date, :date
  end
end
