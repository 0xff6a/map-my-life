class TargetsController < ApplicationController

  def new
    @workout = Workout.find(params[:workout_id])
    @target = Target.new
  end

  def create
    @workout = Workout.find(params[:workout_id])
    @target = Target.create_from(params)

    if @target.save
      @workout.targets << @target
      redirect_to workouts_path
    else
      flash[:error] = @target.flash_error
      render :new
    end

  end

end
