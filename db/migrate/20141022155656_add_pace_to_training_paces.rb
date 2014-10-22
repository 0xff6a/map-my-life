class AddPaceToTrainingPaces < ActiveRecord::Migration
  def change
    add_column :training_paces, :pace, :decimal
  end
end
