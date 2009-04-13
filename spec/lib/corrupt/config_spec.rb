require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Config do
  it 'should have a name' do
    Corrupt::Config['name'].should_not be_nil
  end
end
