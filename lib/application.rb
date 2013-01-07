require 'rubygems'

require 'sinatra/base'

require 'settings'


module Pantheon
  class Application < Sinatra::Base
  end

  module ApplicationHelper
    def cms_url(url)
      "#{CMS_MOUNTED_URL}#{url}"
    end

    def website_url(url)
      #exclute duplication //
      mounted_url = WEBSITE_MOUNTED_URL == '/' ? '' : WEBSITE_MOUNTED_URL

      "#{mounted_url}#{url}"
    end

    def assets_url(url)
      "#{ASSETS_MOUNTED_URL}#{url}"
    end
  end
end
