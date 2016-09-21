class Slack::JobsController < ApplicationController
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }
  
  def create
    if params["payload"]
      # params["payload"].first.second.first["name"] == "add_a_job"
      if params["payload"].include?("add_a_job")
        return render json: {
          "text": "Great! You'd like to add a job. What is your first and last name as they were when you were at Turing?"
        }
      elsif params["payload"].include?("job_stats")
        return render json: {
          "text": "These job stats reflect all the jobs entered to date",
          "attachments": [
            {
              "text": "These are job stats",
              "fallback": "You are unable to view this",
              "callback_id": "job_stats",
              "color": "#3AA3E3",
              "attachment_type": "default",
              "actions": [
                {
                  "name": "job_stats",
                  "text": "Job Stats",
                  "type": "button",
                  "value": "stats"
                }
              ]
            }
          ]
        }
      else
      end
    # elsif JSON.parse(params["payload"]).first.second.first["name"] == "job_stats"
    else
      return render json: {
        "text": "Would you like to view alumni job stats or add your job anonymously?",
        "attachments": [
          {
            "text": "Choose one:",
            "fallback": "You are unable to view this",
            "callback_id": "job_stats",
            "color": "#3AA3E3",
            "attachment_type": "default",
            "actions": [
              {
                "name": "job_stats",
                "text": "Job Stats",
                "type": "button",
                "value": "stats"
              },
              {
                "name": "add_a_job",
                "text": "Add a Job",
                "type": "button",
                "value": "add_job",
                "confirm": {
                  "title": "Added a job before?",
                  "text": "Have you added a job before? If not, please register here first.",
                  "ok_text": "Yes",
                  "dismiss_text": "No"
                }
              }
            ]
          }
        ]
      }
    end

    # return
    # @user_data = JobsService.create_from_slack(command_params)
    # @job = Job.new(job_title: @user_data[:job_title], 
    #                city: @user_data[:city], 
    #                state: @user_data[:state], 
    #                salary: @user_data[:salary],
    #                user: @user_data[:user])
    # if @job.save
    #   render json: {
    #     text: "Thanks for sharing your data"
    #     } 
    # end
  end
  
private
  def command_params
     params.permit(:payload, :actions, :text, :token, :user_id, :user_name, :channel_id, :command, :response_url, :team_id, :team_domain, :channel_name)
   end
end

# sally macnicholas;software developer; turing; denver; colorado; 80000