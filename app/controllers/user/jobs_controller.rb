class User::JobsController < User::BaseController

  def new
    @user = current_user
    @job = Job.new
  end

  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end


  def create
      @job = current_user.jobs.create(job_params)
    if @job.save
      SlackClientService.new.post_job_info(@job.job_title, @job.salary)
      flash[:notice] = "#{@job.job_title} was created!"
      redirect_to jobs_path
    else
      flash[:error] = "#{@job.errors.full_messages.join(", ")}"
      render :new
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    job = Job.find(params[:id])
    if job.update(job_params)
      redirect_to jobs_path
    else
      render :edit
    end
  end

  def destroy
    job = Job.find(params[:id])
    job.delete
    session[:most_recent_job_id] = Job.last.id
    redirect_to jobs_path
  end

  private

  def job_params
    params.require(:job).permit(:current_job, :job_title, :company, :city, :state, :salary, :start_date, :end_date)
  end
end
