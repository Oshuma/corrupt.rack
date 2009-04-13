task :default => 'app:rack'

task :environment do
  require File.dirname(__FILE__) + '/lib/corrupt'
  Corrupt.boot!
end

namespace :app do
  desc 'Run the app with Rack'
  task :rack do
    $stdout.puts 'Starting with rackup...'
    `rackup`
  end
end

namespace :db do
  desc 'Migrate the database (destructive)'
  task :migrate => [:environment] do
    DataMapper.auto_migrate!
  end

  desc 'Migrate the database (non-destructive)'
  task :uprade => [:environment] do
    DataMapper.auto_upgrade!
  end
end
