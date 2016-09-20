class SlackController < ApplicationController
  skip_before_action :verify_authenticity_token
  respond_to :json
  
  # def create
  #   return render json: {}, status: 403 unless valid_slack_token?
  #   CommandWorker.perform_async(command_params.to_h)
  #   render json: { response_type: "ephemeral"}, status: :created
  # end
  def index
    # require "pry"; binding.pry
    render json: params["challenge"]
    # require "pry"; binding.pry
    if params["event"]["text"]
      @name = params["event"]["text"]
      confirm_name
    else
      # deny_name
    # Faraday.get("https://slack.com/api/im.history?token=xoxp-2329094327-38224112384-81444342805-605512a65b&channel=#{params["channel"]["id"]}")
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
  
  def valid_slack_token?
    params[:token] == ENV["SLACK_SLASH_COMMAND_TOKEN"]
  end
end
