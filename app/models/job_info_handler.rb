class JobInfoHandler
  
  def initialize(input) #takes in params["text"]
    
  end
  
  def check_user?
    User.find_by(first_name: first, last_name: last)
  end
  
  def execute
    check_user?
    #call other methods in here
    #call this method first, and it'll check everything
  end
      
    
  
end