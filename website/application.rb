require 'rubygems'

require 'sinatra/base'

require 'models/init'
require 'lib/application'


module Website
  class Application < Pantheon::Application
    get '/:url' do
      page = Page.find_by_url params[:url]
      page.content
    end
  end
end
