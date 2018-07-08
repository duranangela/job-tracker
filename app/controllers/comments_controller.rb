class CommentsController < ApplicationController

  def create
    @job = Job.find(params[:job_id])
    @comment = @job.comments.new(comment_params)

    @comment.save

    redirect_to job_path(@job)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :job_id)
  end

end
