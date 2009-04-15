task :default => 'spec'

task :environment do
  ENV['CORRUPT_ENV'] ||= 'development'
  require File.dirname(__FILE__) + '/lib/corrupt'
  Corrupt.boot!
end

FileList['tasks/**/*.rake'].each { |task| load task }

desc 'Open a console with the library loaded'
task :console do
  lib_dir = File.join(File.dirname(__FILE__), 'lib')
  sh "irb -I #{lib_dir} -r 'corrupt'"
end

desc 'List the configured routes'
task :routes => [ :environment ] do
  width = 30
  puts "| Routes for '#{Corrupt.env}' environment |"
  Corrupt::Router.routes.each do |route|
    print "#{route[0]}".ljust(width)
    print "#{route[1].inspect}".rjust(width)
    puts
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
