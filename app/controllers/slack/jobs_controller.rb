class Slack::JobsController < ApplicationController
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }
  
  def create
    @user_data = JobsService.create_from_slack(command_params)
    require "pry"; binding.pry
    @job = Job.new(job_title: @job_data.job_title, city: @job_data.city, state: @job_data.state, salary: @job_data.salary)
    if Job.save
      render json: {
        text: "Thanks for sharing your data"
        } 
    end
  end
  
private
  def command_params
     params.permit(:text, :token, :user_id, :user_name, :channel_id, :command, :response_url, :team_id, :team_domain, :channel_name)
   end
end

# sally macnicholas;software developer; turing; denver; colorado; 80000