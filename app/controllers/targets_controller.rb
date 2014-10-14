class TargetsController < ApplicationController

  def new
    @target = Target.new
  end

  def create
    @target = Target.create_from(params)

    if @target.save
      redirect_to workouts_path
    else
      flash[:error] = @target.flash_error
      render :new
    end

  end

end
