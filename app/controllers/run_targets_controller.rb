class RunTargetsController < ApplicationController

  def new
    @target = RunTarget.new
  end

  def create
    @target = RunTarget.create_from(params)

    if @target.save
      redirect_to runs_path
    else
      flash[:error] = @target.flash_error
      render :new
    end

  end

end
