require File.expand_path(File.dirname(__FILE__) + '/../app_spec_helper')

describe Article do
  before(:each) do
    Article.all.destroy!
    @attrs = {:title => 'New Article', :content => 'Some content.'}
  end

  it 'should render the Markdown as HTML' do
    content  = "\# Header 1\n"
    content += '[Cool Link](http://example.org/)'
    @article = Article.new(@attrs.merge(:content => content))
    @html    = @article.content_html
    @html.should =~ /h1/
    @html.should =~ /Cool Link/
  end
end
