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

    # Dispatch a request to a controller and action.
    def self.dispatch(path)
      response = @@routes.select { |route| route[0] == path }
      if response.empty?
        puts '404'
        Controllers::Exceptions.new.four_oh_four
      else
        puts 'path found: ' + response.inspect
      end
    end
  end

end # Corrupt
