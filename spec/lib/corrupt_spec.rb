require File.expand_path(File.dirname(__FILE__) + '/lib_spec_helper')

describe Corrupt do
  it 'should have a version string' do
    Corrupt.to_version.should_not be_nil
  end

  it 'should have an environment' do
    Corrupt.env.should == 'test'
  end

  it 'should have a configuration accessor' do
    Corrupt.config.should_not be_nil
  end
end
