class RenameTypeColumn < ActiveRecord::Migration
  def change
    rename_column :workouts, :type, :activity
  end
end
