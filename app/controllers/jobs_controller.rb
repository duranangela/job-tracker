class JobsController < ApplicationController
  def index
    # @company = Company.find(params[:company_id])
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def create
    # @company = Company.find(params[:company_id])
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
    @comment = @job.comments.new
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
    # company = job.company
    job.destroy

    flash[:success] = "#{job.title} was successfully deleted!"
    redirect_to jobs_path
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :category_id, :company_id)
  end
end
