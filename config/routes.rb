# URL routes for the application.
Corrupt::Router.new do |route|
  route.map '/code', :controller => 'Main', :action => 'code'
  route.map '/', :controller => 'Articles', :action => 'index'
end
