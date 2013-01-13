require 'rubygems'

require 'sinatra/base'
require 'sinatra/content_for'

require 'models/init'
require 'lib/application'

module Pantheon
  module Website
    class Application < Pantheon::Application
      set :views, Settings::WEBSITE_VIEWS_PATH

      get '/' do
        @pages = Page.all
        render_index_page
      end

      get '/:url' do
        page = Page.find_by_url params[:url]
        page.content
      end

      module ApplicationHelper
        def namespace(action_name)
          action_name ? "website-application #{action_name}" : "website-application"
        end
      end

      helpers Sinatra::ContentFor, Pantheon::ApplicationHelper, ApplicationHelper
    end
  end
end
