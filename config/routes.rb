# URL routes for the application.
Corrupt::Router.new do |route|
  route.map '/articles', :controller => 'Main', :action => 'articles'
  route.map '/', :controller => 'Main', :action => 'index'
end
