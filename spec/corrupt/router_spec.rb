require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Router do
  before(:each) do
    @router = Router.new
  end

  it 'should map a URL path to a controller/action' do
    @router.map '/path', :controller => 'test', :action => 'path'
  end

  it 'should have at least one route' do
    @router.map '/path', :controller => 'test', :action => 'path'
    Router.routes.size.should == 1
  end
end
