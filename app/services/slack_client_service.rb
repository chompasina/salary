require 'slack'

class SlackClientService
  attr_reader :client

  def initialize
    @client = Slack::Client.new(token: ENV['slack_token'])
    @_conn = Faraday.new("https://api.github.com/rtm.start") do |faraday|
      faraday.adapter           Faraday.default_adapter
      faraday.params['token'] = ENV['bot_token']
    end
  end

  def post_job_info(title, salary)
    client.chat_postMessage(channel: "#practice-jobs", text: "A Turing alum just posted a new job as a #{title} making #{salary}.", icon_emoji: ":monkey_face:")
  end
  
  private
  
  def conn
    @_conn
  end
end