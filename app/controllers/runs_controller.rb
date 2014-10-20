class WorkoutsController < ApplicationController

  MMF = MMFDataLoader.new

  def index
    @workouts = Run.all.reverse
    @targets = RunTarget.all.reverse
  end

  def new
    @workout = Run.new
  end

  def create
    @workout = Run.create_from(params)
    
    if @workout.save
      redirect_to(workouts_path)
    else 
      flash[:error] = @workout.flash_error
      render :new
    end

  end

  def edit
    @workout = Run.find(params[:id])
  end

  def update
    @workout = Run.update_from(params)
    
    if @workout
      redirect_to(workouts_path)
    else  
      flash[:error] = @workout.flash_error
      render :edit
    end
    
  end

  def destroy
    Run.find(params[:id]).delete
    redirect_to workouts_path
  end

  def load_from_mmf
    MMF.save_my_workouts_to_db
    redirect_to '/'
  end

  def new_link
    @workout = Run.find(params[:id])
    @targets = RunTarget.all #filter_by(@workout)
  end

  def link_to_target
    RunTarget.link_workout(params)
    redirect_to '/'
  end

end
