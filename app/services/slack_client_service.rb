require 'slack'

class SlackClientService
  attr_reader :client

  def initialize
    @client = Slack::Client.new(token: ENV["slack_token"])
  end

  def post_job_info(title, salary)
    client.chat_postMessage(channel: "#general", text: "A Turing alum just posted a new job as a #{title} making #{salary}.", icon_emoji: ":monkey_face:")
  end
end