# add current directory to load path
$: << File.expand_path(File.dirname(__FILE__))

require 'settings'
require 'cms/application'
require 'website/application'


map CMS_MOUNTED_URL do
  run CMS::Application
end

map WEBSITE_MOUNTED_URL do
  run Website::Application
end