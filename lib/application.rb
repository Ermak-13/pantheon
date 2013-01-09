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
      #excluding duplicate //
      mounted_url = WEBSITE_MOUNTED_URL == '/' ? '' : WEBSITE_MOUNTED_URL

      "#{mounted_url}#{url}"
    end

    def assets_url(url)
      "#{ASSETS_MOUNTED_URL}#{url}"
    end

    def content_tag(tag, options = {}, &html_inner)
      attributes = ""
      options.each { |k,v| attributes << %Q(#{k}="#{v}") }
      %Q(<#{tag} #{attributes}>#{html_inner.call()}</#{tag}>)
    end

    def link_to(label, url, options = {})
      options.merge!({ href: url })
      content_tag(:a, options) do
        label
      end
    end

    def info_field(label, value)
      html_class = label.downcase.split.join('-')
      content_tag :div, class: "info-field #{html_class}" do
        info_label(label) + info_value(value)
      end
    end

    private
      def info_label(label)
        content_tag :span, class: 'info-label' do
          label
        end
      end

      def info_value(value)
        content_tag :span, class: 'info-value' do
          value
        end
      end
  end
end
