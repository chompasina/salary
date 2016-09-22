class JobInfoHandler
  attr_reader :input
  
  QUESTIONS = ["test", "Hi #{name}! So, you want to add a job? What's your job title?", "What company do you work for?", "Where is this fine company located? (city, state)", "When did you start this job?", "If this is your current job, respond with 'yes'; otherwise, when did you leave this job?"]
  
  def initialize(input) #takes in params["text"]
    @input = input
  end
  
  def check_user?
    first = input.split.first
    last = input.split.last
    @user = User.find_by(first_name: first, last_name: last)      
    @user.update_attributes(input_counter: 1) if @user 
  end
  
  def add_job_title
    @user.update_attributes(input_counter: 2) 
  end
  
  def execute
    check_user?
    add_job
    #call other methods in here
    #call this method first, and it'll check everything
  end
      
  def get_user_counter
    @user.input_counter
  end
    
  
end