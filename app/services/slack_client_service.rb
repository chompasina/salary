require 'slack'

class SlackClientService
  attr_reader :client,
              :input

  def initialize(input)
    @input = input
    @client = Slack::Client.new(token: ENV['app_access_token'])
    # @conn = Faraday.post("https://hooks.slack.com/services/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") do |faraday|
    # # @_conn = Faraday.new("https://api.github.com/rtm.start") do |faraday|
    #   faraday.adapter           Faraday.default_adapter
    #   faraday.params['token'] = ENV['SLACK_API_TOKEN']
    #   faraday.headers['Content-type'] = 'application/json'
    # end
  end

  def post_job_info(title, salary)
    client.chat_postMessage(channel: "#practice-jobs", text: "A Turing alum just posted a new job as a #{title} making #{salary}.", icon_emoji: ":monkey_face:")
  end
  
  
  def confirm_name
    name = input["text"]
    channel = input["channel"]
    job_handler = JobInfoHandler.new(name)
    client2 = Slack::Client.new(token: ENV['bot_access_token'])
    if job_handler.check_user? 
      user_counter = job_handler.get_user_counter
      response = client2.chat_postMessage(
                       channel: channel, 
                       text: "Hi #{name}! So, you want to add a job? What's your job title?"
                       )
                       # JobInfoHandler::QUESTIONS[user_counter]
    else
      response = client2.chat_postMessage(
                       channel: channel, 
                       text: "We weren't able to find your name in our list. Please try again or email Turing staff to look into this issue."
                       )
    # Rails.logger.debug(YAML.dump(response))                  
    end
  end
  
  # private
  # 
  # def conn
  #   @_conn
  # end
end