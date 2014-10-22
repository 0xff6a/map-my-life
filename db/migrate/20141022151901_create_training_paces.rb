class CreateTrainingPaces < ActiveRecord::Migration
  def change
    create_table :training_paces do |t|

      t.timestamps
    end
  end
end
