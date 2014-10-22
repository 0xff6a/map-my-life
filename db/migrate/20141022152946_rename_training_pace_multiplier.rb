class RenameTrainingPaceMultiplier < ActiveRecord::Migration
  def change
    rename_column :training_paces, :multiplier, :multiplier_vo2
  end
end
