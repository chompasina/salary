class JobInfoHandler
  attr_reader :input
  
  def initialize(input) #takes in params["text"]
    @input = input
  end
  
  def check_user?
    first = input.split.first
    last = input.split.last
    @user = User.find_by(first_name: first, last_name: last)      
  end
  
  def add_job
    require "pry"; binding.pry
    # @user.
  end
  
  def execute
    check_user?
    add_job
    #call other methods in here
    #call this method first, and it'll check everything
  end
      
    
  
end