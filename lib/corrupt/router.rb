module Corrupt

  # Handles URL dispatching for the application.
  # Routes are stored in a class variable, accessible by Router.routes.
  class Router
    def initialize(&block)
      @@routes = []
      yield self if block_given?
    end

    # Maps incoming URLs to a controller and action.
    # TODO: Maybe change the routes storage to a hash like:
    #   @@routes[path]  # => options
    def map(path, options)
      @@routes << [path, options]
    end

    # Return the configured routes.
    def self.routes
      @@routes
    end

    # Dispatch a request to a controller and action.
    def self.dispatch(path)
      route = @@routes.select { |route| route[0] == path }.flatten
      # FIXME: This could probably be handled a little better.
      if route.empty?
        Exceptions.new.four_oh_four
      else
        response = route[1]  # 2nd element is the controller/action hash.
        Corrupt::Controller.const_get(response[:controller]).new.send(response[:action])
      end
    end
  end

end # Corrupt
