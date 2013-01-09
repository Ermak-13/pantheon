require 'rubygems'

require 'active_record'

require 'settings'


connection_settings = {}
environment = ENV['RACK_ENV']

database = File.join(Settings::PANTHEON_PATH, environment + '.db')

case environment
when 'development'
  connection_settings = {
    adapter: 'sqlite3',
    database: database
  }

when 'production'
  connection_settings = {
    adapter: 'sqlite3',
    database: database
  }

when 'test'
  connection_settings = {
    adapter: 'sqlite3',
    database: database
  }

end

ActiveRecord::Base.establish_connection(connection_settings)