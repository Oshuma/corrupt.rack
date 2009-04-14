namespace :run do
  task :setup => [ :environment ] do
    require 'rack'
    @application = Corrupt::App
    @options = { :Host => '127.0.0.1', :Port => 9292 }
  end

  desc 'Start the server with rackup'
  task :rackup => [ :environment ] do
    config = File.join(Corrupt.root, 'config.ru')
    sh "rackup #{config}"
  end

  desc 'Start the server with Mongrel handler'
  task :mongrel => [ :environment, :setup ] do
    puts 'Starting with Mongrel handler...'
    Rack::Handler::Mongrel.run @application, @options
  end

  desc 'Start the server with Thin handler'
  task :thin => [ :environment, :setup ] do
    puts 'Starting with Thin handler...'
    Rack::Handler::Thin.run @application, @options
  end
end
