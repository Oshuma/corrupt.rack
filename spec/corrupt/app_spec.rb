require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe App do
  it 'should return a proper Rack response: [status, headers, content]' do
    @response = get('/')
    @response.size.should == 3
    @response[0].should be_instance_of(Fixnum)
    @response[1].should be_instance_of(Hash)
    @response[2].should be_instance_of(String)
  end

  it 'should find /articles' do
    @response = get('/articles')
    @response[0].should == 200
  end

  it 'should return a 404 status' do
    @response = get('/not/a/real/path')
    @response[0].should == 404
  end
end
