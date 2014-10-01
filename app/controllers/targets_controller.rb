class TargetsController < ApplicationController

  def new
    @workout = Workout.find(params[:workout_id])
    @target = Target.new
  end

  def create
    Workout.find(params[:workout_id]).targets.create_from(params)
    redirect_to workouts_path
  end

end
