class AddWorkoutIdToTarget < ActiveRecord::Migration
  def change
    add_reference :targets, :workout, index: true
  end
end
