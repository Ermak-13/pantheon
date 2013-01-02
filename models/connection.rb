require 'active_record'

connection_settings = {}
environment = ENV['RACK_ENV']

case environment
when 'development'
  connection_settings = {
    adapter: 'sqlite3',
    database: '/home/ermak/' + environment + '.db'
  }

when 'production'
  connection_settings = {
    adapter: 'sqlite3',
    database: '/home/ermak/' + environment + '.db'
  }

when 'test'
  connection_settings = {
    adapter: 'sqlite3',
    database: '/home/ermak/' + environment + '.db'
  }

end

ActiveRecord::Base.establish_connection(connection_settings)