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

  def edit
    @workout = Workout.find(params[:id])
  end

  def update
    Workout.find(params[:id]).update(params[:workout].permit(:activity, :date, :duration, :intensity))
    redirect_to workouts_path
  end

end
