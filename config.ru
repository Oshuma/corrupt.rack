require 'rack'
require File.join(File.dirname(__FILE__), 'lib', 'corrupt')

Corrupt.boot!

run Corrupt::App
