require 'rubygems'

require 'sinatra'
require 'active_record'

require 'nokogiri'

require 'lib/support/init'


class Page < ActiveRecord::Base
  before_save :set_title, :set_description

  validates :url, presence: true, uniqueness: true
  validates :content, presence: true
  validates :author, presence: true

  private
    def set_title()
      self.title = get_title if self.title.blank?
    end

    def set_description()
      self.description = get_description if self.description.blank?
    end

    def nokogiri_page()
      Nokogiri::HTML(self.content)
    end

    def get_title()
      nokogiri_title = nokogiri_page.css('title')
      default_title = %Q(<span class="pantheon-warning">Not Exists Title</span>)
      get_value_or_default(nokogiri_title, default_title)
    end

    def get_description()
      nokogiri_body = nokogiri_page.css('body')
      default_description = "Not exists content"
      description = get_value_or_default(nokogiri_body, default_description)

      # truncate length => 320, because max length of description 350 (database)
      description.remove_tags.truncate(320)
    end

    def get_value_or_default(nokogiri_matches, default)
      if !nokogiri_matches.empty? && nokogiri_matches.first.text.chomp.present?
        nokogiri_matches.first.text
      else
        default
      end
    end
end