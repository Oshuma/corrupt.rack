module Corrupt

  # Handles URL dispatching for the application.
  # Routes are stored in a class variable, accessible by Router.routes.
  class Router
    # The Router is normally used like this:
    #   Corrupt::Router.new do |route|
    #     route.map '/path', :controller => 'Kickass', :action => 'take_names'
    #   end
    def initialize(&block)
      @@routes = {}
      yield self if block_given?
    end

    # Maps incoming URLs to a controller and action.
    # TODO: Maybe change the routes storage to a hash like:
    #   @@routes[path]  # => options
    def map(path, options = {})
      @@routes[path] = options
    end

    # Return the configured routes.
    def self.routes
      @@routes
    end

    # Dispatch an incoming request +path+ to a controller and action.
    def self.dispatch(path)
      response = routes[path]
      if response
        Corrupt::Controller.const_get(response[:controller]).new.send(response[:action])
      else
        Exceptions.new.four_oh_four
      end
    end

  end # Router

end # Corrupt
