class TargetsController < ApplicationController

  def new
    @workout = Workout.find(params[:workout_id])
    @target = Target.new
  end

  def create
    target = Target.create(params[:target].permit(:pace, :pace_metric, :distance, :distance_metric, :due_date))
    redirect_to workouts_path
  end

end
