require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Router do
  before(:each) do
    @router = Router.new
  end

  it 'should store the configured routes' do
    @router.map '/',      :controller => 'main',  :action => 'home'
    @router.map '/path',  :controller => 'test',  :action => 'path'
    @router.map '/other', :controller => 'other', :action => 'index'
    Router.routes.size.should == 3
  end
end
