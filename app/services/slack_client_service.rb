require 'slack'

class SlackClientService
  attr_reader :client

  def initialize
    @client = Slack::Client.new(token: ENV['SLACK_TURING_BOT'])
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
  
  # private
  # 
  # def conn
  #   @_conn
  # end
end