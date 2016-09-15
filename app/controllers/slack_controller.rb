class SlackController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def handle
    render json: {
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
    # render text: "I heard you"
  end
end