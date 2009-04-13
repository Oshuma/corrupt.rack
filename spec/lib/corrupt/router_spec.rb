require File.expand_path(File.dirname(__FILE__) + '/../lib_spec_helper')

describe Router do
  before(:each) do
    @router = Router.new
  end

  it 'should store the configured routes' do
    @router.map '/',      :controller => 'Main',  :action => 'home'
    @router.map '/path',  :controller => 'Test',  :action => 'path'
    @router.map '/other', :controller => 'Other', :action => 'index'
    Router.routes.size.should == 3
  end
end
