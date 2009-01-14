# Install hook code here
require 'ftools'

File.copy("#{File.dirname(__FILE__)}/lib/db_login",
            "#{File.dirname(__FILE__)}/../../../script/db_login" )

