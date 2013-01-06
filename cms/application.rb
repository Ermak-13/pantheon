require 'rubygems'

require 'sinatra/base'
require 'sinatra/content_for'
require 'slim'

require 'settings'
require 'models/init'

module CMS
  class Application < Sinatra::Base
    set :views, CMS_VIEWS_PATH

    use Rack::Auth::Basic do |username, password|
      username == HTTP_AUTH_USERNAME && password == HTTP_AUTH_PASSWORD
    end

    get '/page/new' do
      @page = Page.new
      slim :new, locals: { action_name: 'new-page' }
    end

    get '/page/edit/:id' do
      @page = Page.find params['id']
      slim :edit, locals: { action_name: 'edit-page' }
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

    helpers Sinatra::ContentFor, ApplicationHelper
  end
end
