  #Add a job to the db namespace to automatically log into the database the user
  #has defined inside the config/database.yml
namespace :db do
  desc "Automatically log into your database via config/database.yml"
  task :login, :database do |task, args|
    require "#{File.dirname(__FILE__)}/../lib/db_login_code"
    do_login( args.database )
  end

  desc "Automatically log into your database and dump everything out"
  task :dump, :database do |task, args|
    require "#{File.dirname(__FILE__)}/../lib/db_login_code"
    do_login( args.database, :dump )
  end
end
