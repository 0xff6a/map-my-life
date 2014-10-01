class WorkoutsController < ApplicationController

  def index
    @workouts = Workout.all
  end

  def new
    @workout = Workout.new
  end

  def create
    Workout.create_from(params)
    redirect_to workouts_path
  end

  def edit
    @workout = Workout.find(params[:id])
  end

  def update
    Workout.update_from(params)
    redirect_to workouts_path
  end

  def destroy
    Workout.find(params[:id]).delete
    redirect_to workouts_path
  end

end
