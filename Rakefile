task :default => 'run:rackup'

task :environment do
  require File.dirname(__FILE__) + '/lib/corrupt'
  Corrupt.boot!
end

FileList['tasks/**/*.rake'].each { |task| load task }

desc 'Open a console with the library loaded'
task :console do
  lib_dir = File.join(File.dirname(__FILE__), 'lib')
  sh "irb -I #{lib_dir} -r 'corrupt'"
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
