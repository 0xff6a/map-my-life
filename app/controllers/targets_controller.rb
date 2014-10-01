class TargetsController < ApplicationController

  def new
    @workout = Workout.find(params[:workout_id])
    @target = Target.new
  end

  def create
    @workout = Workout.find(params[:workout_id])
    @target = @workout.targets.create_from(params)

    if @target.save
      redirect_to workouts_path
    else
      flash[:error] = @target.flash_error
      render :new
    end

  end

end
