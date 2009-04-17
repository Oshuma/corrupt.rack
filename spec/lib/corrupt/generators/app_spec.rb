require File.expand_path(File.dirname(__FILE__) + '/../../lib_spec_helper')

require 'fileutils'

describe Generators::App do
  before(:each) do
    @path = '/tmp/test_corrupt_app'
    FileUtils.rm_f(@path) if File.exists?(@path)
  end

  it 'should create the new directory' do
    Generators::App.new(@path)
    File.exists?(@path).should be_true
  end
end
