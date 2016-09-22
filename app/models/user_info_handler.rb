class UserInfoHandler
  attr_reader :input,
              :user
  
  def initialize(input)
    @input = input
  end
  
  def check_user?
    first = input.split.first
    last = input.split.last
    @user = User.find_by(first_name: first, last_name: last)      
  end
  
  def get_user_counter
    if @user 
      @user.input_counter
    else
      nil
    end
  end
  
  def incrementer
    @user.increment!(:input_counter, by = 1) if @user 
  end
  
  def decrementer
    @user.update_attributes(input_counter: 0)
  end
  
end