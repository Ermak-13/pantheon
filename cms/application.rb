require 'rubygems'

require 'sinatra/base'
require 'sinatra/content_for'

require 'active_support/all'
require 'slim'

require 'lib/application'
require 'lib/support/init'
require 'models/init'
require 'settings'


module Pantheon
  module CMS
    class Application < Pantheon::Application
      set :views, Settings::CMS_VIEWS_PATH

      use Rack::Auth::Basic do |username, password|
        username == Settings::HTTP_AUTH_USERNAME &&
          password == Settings::HTTP_AUTH_PASSWORD
      end

      get '/pages' do
        @pages = Page.all
        render_index_page
      end

      get '/page/new' do
        @page = Page.new
        render_new_page
      end

      get '/page/edit/:id' do
        @page = Page.find params['id']
        render_edit_page
      end

      post '/page/create' do
        @page = Page.new params['page']
        if @page.save
          redirect to("/page/edit/#{@page.id}")
        else
          render_new_page
        end
      end

      post '/page/update/:id' do
        @page = Page.find params['id']
        if @page.update_attributes params['page']
          redirect to("/page/edit/#{@page.id}")
        else
          render_edit_page
        end
      end

      get '/page/remove/:id' do
        @page = Page.find params[:id]
        @page.destroy
        redirect to('/pages')
      end

      module ApplicationHelper
        def namespace(action_name)
          action_name ? "cms-application #{action_name}" : "cms-application"
        end

        def title
          content_tag :title do
            Settings::CMS_TITLE
          end
        end
      end

      helpers Sinatra::ContentFor, Pantheon::ApplicationHelper, ApplicationHelper
    end
  end
end