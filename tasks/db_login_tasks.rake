  #Give the user a rake method to call the script as well
namespace :db do
  desc "Automatically log into your database via config/database.yml"
  task :login, :database do |task, args|
    require "#{File.dirname(__FILE__)}/../lib/db_login_code"
    do_login( args.database )
  end
end
