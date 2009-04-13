require File.expand_path(File.dirname(__FILE__) + '/../app_spec_helper')

include Controllers

describe Main do
  before(:each) do
    @controller = Main.new
  end

  it 'should respond to the index action' do
    @response = @controller.index
    @response[0].should == 200
  end
end
