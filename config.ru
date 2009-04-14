require 'rack'
require File.join(File.dirname(__FILE__), 'lib', 'corrupt')

ENV['CORRUPT_ENV'] ||= 'production'
Corrupt.boot!
run Corrupt::App
