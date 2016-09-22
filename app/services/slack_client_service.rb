require 'slack'

class SlackClientService
  attr_reader :client,
              :input,
              :user

  def initialize(input, user)
    @input = input
    @client = Slack::Client.new(token: ENV['app_access_token'])
    @user = user
  end

  def post_job_info(title, salary)
    client.chat_postMessage(channel: "#practice-jobs", text: "A Turing alum just posted a new job as a #{title} making #{salary}.", icon_emoji: ":monkey_face:")
  end
  
  def add_job
    Rails.logger.debug
  end
    
  def confirm_name
    user_input = input["text"]
    channel = input["channel"]
    user_handler = UserInfoHandler.new(user_input)
    client2 = Slack::Client.new(token: ENV['bot_access_token'])
    unless user
      response = client2.chat_postMessage(
                        channel: channel, 
                        text: "We weren't able to find your name in our list. Please try again or email Turing staff to look into this issue."
                        )
                        Rails.logger.debug(YAML.dump(response))                  
      return
    end
    if user && user.input_counter == 0
        response = client2.chat_postMessage(
                       channel: channel, 
                       text: "Hi #{user.first_name}! So, you want to add a job? What's your job title?"
                       )
        user.increment!(:input_counter, by = 1)
       Rails.logger.debug(YAML.dump(response))                  
    elsif user.input_counter == 1
        #  job_handler.add_job_title
       response = client2.chat_postMessage(
       channel: channel, 
       text: "Great! What company do you work for?"
       )
       user.increment!(:input_counter, by = 1)
     elsif user.input_counter == 2
       response = client2.chat_postMessage(
       channel: channel, 
       text: "And where is this fine company located?"
       )
       user.increment!(:input_counter, by = 1)
     elsif user.input_counter == 3
       response = client2.chat_postMessage(
       channel: channel, 
       text: "What is your yearly salary in this job? (Again, this is all strictly confidential.)"
       )
       user.increment!(:input_counter, by = 1)
     elsif user.input_counter == 4
       response = client2.chat_postMessage(
       channel: channel, 
       text: "Almost done. When did you start this job? If you're no longer at this job, you can provide your end date in the next question. Please enter dates like mm/dd/yyyy."
       )
       user.increment!(:input_counter, by = 1)
     elsif user.input_counter == 5
       response = client2.chat_postMessage(
       channel: channel, 
       text: "Last question: if this is a previous job, when did you leave this job? mm/dd/yyyy" 
       )
       user.increment!(:input_counter, by = 1)
     elsif user.input_counter == 6
       response = client2.chat_postMessage(
       channel: channel, 
       text: "Great, thanks for anonymously sharing your job data with us! Your data can now be used in the statistics to help current student, prospective students, and staff members make better decisions."
       )
       user.decrement!(:input_counter, by = 6)
     else
    end
  end
end