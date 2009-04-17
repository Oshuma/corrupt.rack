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
  require 'corrupt'
rescue LoadError
  # TODO: This might get moved to /vendor or some shit.
  require File.join(File.dirname(__FILE__), 'lib', 'corrupt')
end

Corrupt.boot!
run Corrupt::App
