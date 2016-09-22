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
    user_input = input["text"]
    channel = input["channel"]
    job_handler = JobInfoHandler.new(user_input)
    client2 = Slack::Client.new(token: ENV['bot_access_token'])
    if job_handler.get_user_counter == nil
      if job_handler.check_user? 
      # user_counter = job_handler.get_user_counter
        response = client2.chat_postMessage(
                         channel: channel, 
                         text: "Hi #{user_input}! So, you want to add a job? What's your job title?"
                         )
                         # JobInfoHandler::QUESTIONS[user_counter]
      else
       response = client2.chat_postMessage(
       channel: channel, 
       text: "We weren't able to find your name in our list. Please try again or email Turing staff to look into this issue."
       )
       # Rails.logger.debug(YAML.dump(response))                  
     end
   elsif job_handler.get_user_counter == 1
     job_handler.add_job_title
     response = client2.chat_postMessage(
     channel: channel, 
     text: "Great! What company do you work for?"
     )
   elsif job_handler.get_user_counter == 2
     response = client2.chat_postMessage(
     channel: channel, 
     text: "And where is this fine company located?"
     )
   elsif job_handler.get_user_counter == 3
     response = client2.chat_postMessage(
     channel: channel, 
     text: "What is your yearly salary in this job? (Again, this is all strictly confidential.)"
     )
   elsif job_handler.get_user_counter == 4
     response = client2.chat_postMessage(
     channel: channel, 
     text: "Almost done. When did you start this job? If you're no longer at this job, you can provide your end date in the next question. Please enter dates like mm/dd/yyyy."
     )
   elsif job_handler.get_user_counter == 5
     response = client2.chat_postMessage(
     channel: channel, 
     text: "Last question: if this is a previous job, when did you leave this job? mm/dd/yyyy" 
     )
   elsif job_handler.get_user_counter == 6
     response = client2.chat_postMessage(
     channel: channel, 
     text: "Great, thanks for anonymously sharing your job data with us! Your data can now be used in the statistics to help current student, prospective students, and staff members make better decisions."
     )
   else
   end
  end
  
  # private
  # 
  # def conn
  #   @_conn
  # end
end