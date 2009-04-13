module Corrupt

  # Handles URL dispatching for the application.
  # Routes are stored in a class variable, accessible by Router.routes.
  class Router
    def initialize(&block)
      @@routes = []
      yield self if block_given?
    end

    # Maps incoming URLs to a controller and action.
    def map(path, options)
      @@routes << [path, options]
    end

    # Return the configured routes.
    def self.routes
      @@routes
    end
  end

end # Corrupt
