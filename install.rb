# Install hook code here
require 'ftools'

File.copy("#{File.dirname(__FILE__)}/lib/db_login",
            "#{File.dirname(__FILE__)}/../../../scripts/db_login" )

