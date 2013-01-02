require 'rubygems'

# add current directory to load path
$: << File.expand_path(File.dirname(__FILE__))

require 'sprockets'

require 'cms/application'
require 'website/application'
require 'settings'


map ASSETS_MOUNTED_URL do
  environment = Sprockets::Environment.new
  environment.append_path CMS_ASSETS_PATH
  environment.append_path WEBSITE_ASSETS_PATH

  run environment
end

map CMS_MOUNTED_URL do
  run CMS::Application
end

map WEBSITE_MOUNTED_URL do
  run Website::Application
end