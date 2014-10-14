class WorkoutsController < ApplicationController

  MMF = MMFDataLoader.new

  def index
    @workouts = Workout.all.reverse
    @targets = Target.all.reverse
  end

  def new
    @workout = Workout.new
  end

  def create
    @workout = Workout.create_from(params)
    
    if @workout.save
      redirect_to(workouts_path)
    else 
      flash[:error] = @workout.flash_error
      render :new
    end

  end

  def edit
    @workout = Workout.find(params[:id])
  end

  def update
    @workout = Workout.update_from(params)
    
    if @workout
      redirect_to(workouts_path)
    else  
      flash[:error] = @workout.flash_error
      render :edit
    end
    
  end

  def destroy
    Workout.find(params[:id]).delete
    redirect_to workouts_path
  end

  def load_from_mmf
    MMF.save_my_workouts_to_db
    redirect_to '/'
  end

  def new_link
    @workout = Workout.find(params[:id])
    @targets = Target.all #filter_by(@workout)
  end

  def link_to_target
    Target.link_workout(params)
    redirect_to '/'
  end

end
