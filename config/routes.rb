# URL routes for the application.
Corrupt::Router.new do |route|
  route.map '/', :controller => 'Main', :action => 'index'
end
