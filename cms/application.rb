require 'rubygems'

require 'sinatra/base'
require 'sinatra/content_for'

require 'active_support/all'
require 'slim'

require 'lib/application'
require 'lib/support/init'
require 'models/init'
require 'settings'


module CMS
  class Application < Pantheon::Application
    set :views, CMS_VIEWS_PATH

    use Rack::Auth::Basic do |username, password|
      username == HTTP_AUTH_USERNAME && password == HTTP_AUTH_PASSWORD
    end

    get '/pages' do
      @pages = Page.all
      slim %s{pages/index}, locals: { action_name: 'index-page' }
    end

    get '/page/new' do
      @page = Page.new
      slim %s{pages/new}, locals: { action_name: 'new-page' }
    end

    get '/page/edit/:id' do
      @page = Page.find params['id']
      slim %s{pages/edit}, locals: { action_name: 'edit-page' }
    end

    post '/page/create' do
      @page = Page.new params['page']
      @page.save
      redirect to('/page/edit' + @page.id)
    end

    post '/page/update/:id' do
      @page = Page.find params['id'].to_i
      @page.update_attributes params['page']
      redirect to('/page/edit/' + @page.id.to_s)
    end


    module ApplicationHelper
      def namespace(action_name)
        action_name ? "cms-application #{action_name}" : "cms-application"
      end
    end

    helpers Sinatra::ContentFor, Pantheon::ApplicationHelper, ApplicationHelper
  end
end
