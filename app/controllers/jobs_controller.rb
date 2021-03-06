class JobsController < ApplicationController
  def index
    if params[:location]
      @jobs = Job.location_params(params)
      @header = "#{params[:location]} Jobs"
    elsif params[:category]
      @jobs = Job.category_params(params)
      @header = "#{params[:category]} Jobs"
    elsif params[:sort]
      params_sort(params)
    else
      @jobs = Job.all
      @header = "All Jobs"
    end
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title}"
      redirect_to job_path(@job)
    else
      render :new
    end
  end

  def show
    @job = Job.find(params[:id])
    @company = @job.company
    @category = @job.category
    @comment = @job.comments.new
    @comments = @job.comments.order_by_date
  end

  def edit
    @job = Job.find(params[:id])
    @company = @job.company
  end

  def update
    @job = Job.find(params[:id])
    @job.update(job_params)
    if @job.save
      flash[:success] = "#{@job.title} updated!"
      redirect_to job_path(@job)
    else
      render :edit
    end
  end

  def destroy
    job = Job.find(params[:id])
    job.destroy

    flash[:success] = "#{job.title} was successfully deleted!"
    redirect_to jobs_path
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :category_id, :company_id)
  end

  def params_sort(params)
    if params[:sort]=='interest'
      @jobs = Job.sort_level_interest
      @header = 'Jobs sorted by Level of Interest'
    else params[:sort]=='location'
      @jobs = Job.city_sort
      @header = 'Jobs sorted by City'
    end
  end
end
