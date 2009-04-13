require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Corrupt do
  it 'should have a version string' do
    Corrupt.to_version.should_not be_nil
  end
end
