class RunsController < ApplicationController

  MMF = MMFDataLoader.new

  def test
    
  end

  def index
    @runs = Run.all.reverse
    @run_targets = RunTarget.all.reverse
  end

  def new
    @run = Run.new
  end

  def create
    @run = Run.create_from(params)
    
    if @run.save
      redirect_to(runs_path)
    else 
      flash[:error] = @run.flash_error
      render :new
    end

  end

  def edit
    @run = Run.find(params[:id])
  end

  def update
    @run = Run.update_from(params)
    
    if @run
      redirect_to(runs_path)
    else  
      flash[:error] = @run.flash_error
      render :edit
    end
    
  end

  def destroy
    Run.find(params[:id]).delete
    redirect_to runs_path
  end

  def load_from_mmf
    MMF.save_my_workouts_to_db
    redirect_to runs_path
  end

  def new_link
    @run = Run.find(params[:id])
    @run_targets = RunTarget.all #filter_by(@workout)
  end

  def link_to_target
    Target.link_workout(params)
    redirect_to runs_path
  end

end
