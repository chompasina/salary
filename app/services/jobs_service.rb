class JobsService
  # include Madison

  attr_reader :job_data
  
  def self.create_from_slack(params)
    job_data = params["text"].split(";")
    require "pry"; binding.pry
    name = job_data[0]
    first = name.split(" ").first
    last = name.split(" ").last
    slack_user = User.where(first_name: first, last_name: last)
    if slack_user.count == 0 
      nil
    else
      {
        user: slack_user.first,
        job_title: job_data[1].downcase,
        company: job_data[2].capitalize,
        city: job_data[3].capitalize, 
        state: job_data[4].capitalize,
        salary: job_data[5]    
      }
    end
  end
  
  def self.job_title
    job_data[1].downcase
  end
  
  def self.company
    job_data[2].capitalize
  end
  
  def self.city
    job_data[3].capitalize
  end
  
  def self.state
    state = job_data[4].capitalize
      if state.count > 2
        JobsService.state_abbrev(state)
      else
        state
      end
    end
    
  def self.salary
    salary = job_data[5]
    salary.delete(",", "$")
  end
  
  # def find_user(name)
  #   first = name.split(" ").first
  #   last = name.split(" ").last
  #   slack_user = User.where(first_name: first, last_name: last)
  #   if slack_user.count == 0 
  #     render text: "Cannot find that user"
  #   else
  #     slack_user
  #   end
  # end
  
  
    private
    # 
    # def data
    # want this to be rtm start to get params of last message back
    #   @data ||= Faraday.get("http://")
    # end
  
end