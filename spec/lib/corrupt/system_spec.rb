require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe System do
  it 'should boot and load the config' do
    System.boot!
    Corrupt::Config.should_not be_nil
  end
end
