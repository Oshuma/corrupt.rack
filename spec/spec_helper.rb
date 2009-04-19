require 'rubygems'
require 'spec'

# TODO: This is kinda convoluted and stupid.  Should just stick to one path for the specs.
begin
  require File.dirname(__FILE__) + '/../lib/corrupt'
rescue LoadError
  begin
    require File.dirname(__FILE__) + '/../vendor/corrupt/corrupt'
  rescue LoadError
    require 'corrupt'
  end
end

ENV['CORRUPT_ENV'] = 'test'
Corrupt.boot!

module RequestHelpers
  # Send a GET request through the stack.
  def get(path)
    env = {'PATH_INFO' => path}
    Corrupt::App.call(env)
  end
end

Spec::Runner.configure do |config|
  include Corrupt

  config.include RequestHelpers

  config.before(:all) do
    DataMapper.auto_migrate!
  end
end
