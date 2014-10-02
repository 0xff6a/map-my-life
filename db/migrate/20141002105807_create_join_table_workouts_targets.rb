class CreateJoinTableWorkoutsTargets < ActiveRecord::Migration
  def change
    create_join_table :workouts, :targets do |t|
      # t.index [:workout_id, :target_id]
      # t.index [:target_id, :workout_id]
    end
  end
end
