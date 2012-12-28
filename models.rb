require 'sinatra'
require 'sinatra/activerecord'

set :database, 'sqlite:///development.db'

class Page < ActiveRecord::Base
end