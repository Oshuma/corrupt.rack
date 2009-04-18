require File.expand_path(File.dirname(__FILE__) + '/../lib_spec_helper')

describe Router do
  before(:each) do
    @router = Router.new
  end

  it 'should store the configured routes' do
    @router.map '/', :controller => 'Main',  :action => 'index'
    @router.map '/kickass', :controller => 'Kickass',  :action => 'take_names'
    Router.routes.size.should == 2
  end

  it 'should respond to either /main or /main/' do
    @router.map '/main', :controller => 'Main', :action => 'index'
    get('/main')[0].should == 200
    get('/main/')[0].should == 200
  end
end
