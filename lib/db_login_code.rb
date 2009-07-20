require 'yaml'

def do_login( env = nil, action = :login )
    #Nil out my yaml file
  yaml_file = nil

  	#if the user didn't give me a env default to development
  env = 'development' if env.to_s == ''

  	#Look for a config directory
  dir = File.dirname(__FILE__)
  10.times do 
	  #puts "#{dir} if #{File.directory?( "#{dir}/config" )}	and #{File.exist?("#{dir}/config/database.yml")}"

  			#Track any files we find now
	  if File.directory?( "#{dir}/config" )	and 
        File.exist?("#{dir}/config/database.yml")
  		yaml_file = "#{dir}/config/database.yml"
	  end

  		#If we found my yaml file then quit out
	  break if !yaml_file.nil?

  		#Move back a directory
	  dir = "#{dir}/.."
  end

  	#Quit the program if we didn't find a config file
  exit if yaml_file.nil?

  	#Load my yaml file
  yaml = YAML::load(File.open(yaml_file))

  	#load up the requested database now
  if action == :login
    case yaml[env]["adapter"]
    when "sqlite3"
  	  exec("sqlite3 #{dir}/#{yaml[env]["database"]}")
    when "mysql"
    	exec("mysql -u #{yaml[env]["username"]} --password=#{yaml[env]["password"]} #{yaml[env]["database"]}")
    else
      raise "#{yaml[env]["adapter"]} is not implemented yet"
    end

    #Dump the database!
  elsif action == :dump
    case yaml[env]["adapter"]
    when "mysql"
    	exec("mysqldump -u #{yaml[env]["username"]} --password=#{yaml[env]["password"]} #{yaml[env]["database"]}")
    else
      raise "#{yaml[env]["adapter"]} is not implemented yet"
    end
  end
end
