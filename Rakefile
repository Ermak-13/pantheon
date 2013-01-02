# add current directory to load path
$: << File.expand_path(File.dirname(__FILE__))

namespace :db do
  task :environment do
    require 'active_record'
    require 'models/connection'
  end

  desc "Migrate the database"
  task(:migrate => :environment) do
    ActiveRecord::Migration.verbose = true
    ActiveRecord::Migrator.migrate("models/migrates")
  end
end
