FactoryGirl.define do
  factory :user do
    birthdate "01/01/1980"
    username
    password "password"
    email
    admin "false"
    first_name
    last_name
    cohort
  end
  
  factory :job do
    job_title
    company
    city 
    state
    salary
    start_date
    current_job "false"
    end_date
  end
  
  sequence :username do |n|
    "Username #{n}" 
  end
  
  sequence :email do |n|
    "email#{n}@gmail.com" 
  end
  
  sequence :first_name do |n|
    "First Name #{n}" 
  end
  
  sequence :last_name do |n|
    "Last Name #{n}" 
  end

  sequence :job_title do |n|
    "Job #{n}" 
  end
  
  sequence :company do |n|
    "Company #{n}" 
  end
  
  sequence :city do |n|
    "City #{n}" 
  end
  
  sequence :state do |n|
    "State #{n}" 
  end

  sequence :salary do |n|
    "8#{n}000" 
  end

  sequence :start_date do |n|
    "06/0#{n}/2015" 
  end
  
  sequence :end_date do |n|
    "09/0#{n}/2015" 
  end
  
  sequence :cohort do |n|
    "160#{n}" 
  end
end
