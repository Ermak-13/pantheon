require 'sinatra/base'

require 'models/init'


module Website
  class Application < Sinatra::Base
    get '/:url' do
      page = Page.find_by_url params[:url]
      page.content
    end
  end
end
