require 'rubygems'

begin
  require 'settings_local'
rescue LoadError
  warn 'settings_local.rb is not exists.'
end


PANTHEON_PATH = File.expand_path(File.dirname(__FILE__))

ASSETS_MOUNTED_URL ||= '/assets'
CMS_MOUNTED_URL ||= '/admin'
WEBSITE_MOUNTED_URL ||= '/'

CMS_VIEWS_PATH ||= File.join(PANTHEON_PATH, 'cms', 'views')
WEBSITE_VIEWS_PATH ||= File.join(PANTHEON_PATH, 'website', 'views')

CMS_ASSETS_PATH ||= File.join(PANTHEON_PATH, 'cms', 'assets')
WEBSITE_ASSETS_PATH ||= File.join(PANTHEON_PATH, 'website', 'assets')

HTTP_AUTH_USERNAME ||= 'admin'
HTTP_AUTH_PASSWORD ||= 'admin'
