# add current directory to load path
$: << File.expand_path(File.dirname(__FILE__))

require 'website/application'
require 'cms/application'


map '/' do
  run Website::Application
end