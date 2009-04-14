require 'rack'
require File.join(File.dirname(__FILE__), 'lib', 'corrupt')

# Setup some Rack middleware.
static_paths = ['/stylesheets', '/javascripts']
use Rack::Static, :urls => static_paths, :root => 'public'

ENV['CORRUPT_ENV'] ||= 'production'
Corrupt.boot!
run Corrupt::App
