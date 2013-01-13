require 'rubygems'

# add current directory to load path
$: << File.expand_path(File.dirname(__FILE__))

require 'sprockets'

require 'cms/application'
require 'website/application'
require 'settings'


# aliases for modules
Settings = Pantheon::Settings
CMS = Pantheon::CMS
Website = Pantheon::Website

map Settings::ASSETS_MOUNTED_URL do
  environment = Sprockets::Environment.new
  environment.append_path Settings::CMS_ASSETS_PATH
  environment.append_path Settings::WEBSITE_ASSETS_PATH
  environment.append_path Settings::LIB_ASSETS_PATH

  run environment
end

map Settings::CMS_MOUNTED_URL do
  run CMS::Application
end

map Settings::WEBSITE_MOUNTED_URL do
  run Website::Application
end