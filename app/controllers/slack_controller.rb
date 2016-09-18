class SlackController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  # def create
  #   return render json: {}, status: 403 unless valid_slack_token?
  #   CommandWorker.perform_async(command_params.to_h)
  #   render json: { response_type: "ephemeral"}, status: :created
  # end
    
  
  def handle 
    require "pry"; binding.pry
  #   raw_response = Faraday.get("https://slack.com/api/rtm.start", params: {
  #     token: ENV['slack_token']
  #     })
  #   parsed_response = JSON.pretty_generate(JSON.parse(raw_response.body))
  #   puts parsed_response['url']
  end
  
  
  
  private 
  
  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
  
  def valid_slack_token?
    params[:token] == ENV["SLACK_SLASH_COMMAND_TOKEN"]
  end
  

end
