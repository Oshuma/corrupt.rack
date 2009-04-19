require 'rack'

# Setup some Rack middleware.
static_paths = [
  '/favicon.ico',
  '/images',
  '/javascripts',
  '/stylesheets'
]
use Rack::Static, :urls => static_paths, :root => 'public'

# Corrupt this motherfucker.
ENV['CORRUPT_ENV'] ||= 'production'

begin
  # Try to load from ./vendor first.
  require File.join(Dir.pwd, 'vendor', 'corrupt')
rescue LoadError
  # Now try the gem.
  begin
    require 'corrupt'
  rescue LoadError
    require 'rubygems'
    require 'corrupt'
  end
end

Corrupt.boot!
run Corrupt::App
