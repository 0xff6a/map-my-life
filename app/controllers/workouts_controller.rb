class WorkoutsController < ApplicationController

  def index
    @workouts = Workout.all
  end

  def new
    @workout = Workout.new
  end

  def create
    Workout.create(params[:workout].permit(:activity, :date, :duration, :intensity))
    redirect_to workouts_path
  end

end
