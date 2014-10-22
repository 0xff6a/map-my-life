class AddAttributesToTrainingPace < ActiveRecord::Migration
  def change
    add_column :training_paces, :name, :string
    add_column :training_paces, :description, :text
    add_column :training_paces, :multiplier, :decimal
  end
end
