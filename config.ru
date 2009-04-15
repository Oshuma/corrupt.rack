require 'rack'
require File.join(File.dirname(__FILE__), 'lib', 'corrupt')

# Setup some Rack middleware.
static_paths = [
  '/favicon.ico',
  '/images',
  '/javascripts',
  '/stylesheets'
]
use Rack::Static, :urls => static_paths, :root => 'public'

ENV['CORRUPT_ENV'] ||= 'production'
Corrupt.boot!
run Corrupt::App
