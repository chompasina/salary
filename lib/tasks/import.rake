require 'csv'

desc "Import students from csv file"
task :import => [:environment] do   
  
files = ["db/csv/hungry_academy.csv", 
         "db/csv/gschool_0.csv", 
         "db/csv/gschool_1.csv", 
         "db/csv/1603.csv", 
         "db/csv/1602.csv", 
         "db/csv/1511.csv", 
         "db/csv/1510.csv", 
         "db/csv/1508.csv", 
         "db/csv/1507.csv", 
         "db/csv/1505.csv", 
         "db/csv/1503.csv", 
         "db/csv/1502.csv", 
         "db/csv/1412.csv", 
         "db/csv/1410.csv", 
         "db/csv/1409.csv", 
         "db/csv/1407.csv", 
         "db/csv/1406.csv"]

files.each do |file|
  puts file 
  CSV.foreach(file, headers: false) do |row|
    first_name = row.first.strip.split.first
    last_name = row.first.strip.split.last
    puts "importing #{first_name} #{last_name}"
    
      User.create!(
        first_name: first_name,
        last_name: last_name,
        username: "#{first_name}.#{last_name}",
        email: "#{first_name}.#{last_name}@gmail.com",
        password: "#{row.first.strip.split.first}_password"
      )
    end
  end
end