require 'rubygems'
require 'spec'

require File.expand_path(File.dirname(__FILE__) + '/../lib/corrupt')

ENV['CORRUPT_ENV'] = 'test'
Corrupt.boot!

Spec::Runner.configure do |config|
  config.before(:all) do
    DataMapper.auto_migrate!
  end
end
