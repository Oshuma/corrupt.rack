require File.expand_path(File.dirname(__FILE__) + '/../app_spec_helper')

describe Page do
  it 'should have title and content accessors' do
    title   = 'Kickass Page'
    content = "This is some bitchin' content."

    page = Page.new(title)
    page.content = content

    page.title.should   == title
    page.content.should == content
  end
end
