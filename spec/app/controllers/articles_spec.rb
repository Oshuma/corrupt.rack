require File.expand_path(File.dirname(__FILE__) + '/../app_spec_helper')

include Controllers

describe Articles do
  before(:each) do
    @controller = Articles.new
    Router.new.map '/articles', :controller => 'Articles', :action => 'index'
  end

  # TODO: This spec will go away or be moved.
  it 'should respond to either /articles or /articles/' do
    get('/articles')[0].should == 200
  end
end
