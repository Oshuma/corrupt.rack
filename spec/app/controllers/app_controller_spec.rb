require File.expand_path(File.dirname(__FILE__) + '/../app_spec_helper')

describe AppController do
  before(:each) do
    @controller = AppController.new
  end

  it 'should return a default response' do
    @response = @controller.return_response
    @response.size.should == 3
  end
end
