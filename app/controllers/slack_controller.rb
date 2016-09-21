class SlackController < ApplicationController
  rescue_from Exception, with: :text_error_handler
  skip_before_action :verify_authenticity_token
  before_action :verify_slack_token, only: [:index]
  respond_to :json
  
  def text_error_handler(error)
    Rails.logger.info("Slack Command encountered error: #{error.class} -- #{error.message}")
    Rails.logger.info(error.backtrace.join("\n"))
    render text: "Error: #{error.class} -- #{error.message}"
  end
  
  # def create
  #   return render json: {}, status: 403 unless valid_slack_token?
  #   CommandWorker.perform_async(command_params.to_h)
  #   render json: { response_type: "ephemeral"}, status: :created
  # end
  
  def index
    if params["event"]["text"]
      @name = params["event"]["text"]
      # confirm_name
    else
      # deny_name
    end
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
  
  # def handle 
  #   require "pry"; binding.pry
  # #   raw_response = Faraday.get("https://slack.com/api/rtm.start", params: {
  # #     token: ENV['slack_token']
  # #     })
  # #   parsed_response = JSON.pretty_generate(JSON.parse(raw_response.body))
  # #   puts parsed_response['url']
  # end
  
  
  
  private 
  
  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
  
  def verify_slack_token
    if params["challenge"] 
      render json: params["challenge"]
    end
    # require "pry"; binding.pry
  end
  
  def valid_slack_token?
    params[:token] == ENV["SLACK_SLASH_COMMAND_TOKEN"]
  end
end
