require 'rubygems'
require 'spec'

require File.expand_path(File.dirname(__FILE__) + '/../lib/corrupt')

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
