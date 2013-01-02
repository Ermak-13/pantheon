PANTHEON_PATH = File.expand_path(File.dirname(__FILE__))

CMS_MOUNTED_URL = '/admin'
WEBSITE_MOUNTED_URL = '/'

HTTP_AUTH_USERNAME = 'admin'
HTTP_AUTH_PASSWORD = 'admin'

begin
  require 'settings_local'
rescue LoadError
  warn 'settings_local.rb is not exists.'
end
