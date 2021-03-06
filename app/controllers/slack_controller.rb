class SlackController < ApplicationController
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }

  rescue_from Exception, with: :text_error_handler
  skip_before_action :verify_authenticity_token
  before_action :verify_slack_token, only: [:index]
  
  def text_error_handler(error)
    Rails.logger.info("Slack Command encountered error: #{error.class} -- #{error.message}")
    Rails.logger.info(error.backtrace.join("\n"))
    render text: "Error: #{error.class} -- #{error.message}"
  end

  
  def index
   if params["event"]["user"] && params["event"]["subtype"] != "bot_message"
      find_user(params["event"]["text"], params["event"]["user"]) 
      SlackClientService.new(params["event"], @user).confirm_name 
    end
    head :ok 
  end
  
  def confirm_name
    return render json: {
      "text": "Your name is #{@name}",
      "attachments": [
        {
          "text": "Choose one:",
          "fallback": "You are unable to view this",
          "callback_id": "name_confirmation",
          "color": "#3AA3E3",
          "attachment_type": "default",
          "actions": [
            {
              "name": "yes",
              "text": "My name is correct",
              "type": "button",
              "value": "yes name"
            },
            {
              "name": "no",
              "text": "My name is incorrect",
              "type": "button",
              "value": "no name"
              }
            ]
          }
        ]
      }
  end
  
  def deny_name
    return render json: { 
    "text": "I'm sorry, please start over"
    }
  end
  
  
  private 
  
  def find_user(input, slack_user_id)
    @user = User.find_by(first_name: input.split.first, last_name: input.split.last) 
    if @user == nil
      @user = User.find_by(slack_user_id: slack_user_id)
    else
      @user.update_attributes(slack_user_id: slack_user_id)
    end
  end
  
  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
  
  def verify_slack_token
    if params["challenge"] 
      render json: params["challenge"]
    end
  end
  
  def valid_slack_token?
    params[:token] == ENV["SLACK_SLASH_COMMAND_TOKEN"]
  end
end
