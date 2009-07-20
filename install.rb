# Install hook code here
require 'ftools'

File.copy("#{File.dirname(__FILE__)}/lib/db_login",
            "#{File.dirname(__FILE__)}/../../../script/db_login" )
File.copy("#{File.dirname(__FILE__)}/lib/db_dump",
            "#{File.dirname(__FILE__)}/../../../script/db_dump" )

