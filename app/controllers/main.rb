module Corrupt
  module Controllers

    # Handles the home page and various others.
    class Main < AppController

      # GET /
      def index
        template('main/index.haml')
        return_response do |content|
          content.title = 'Main Index'
          content.version = "#{Corrupt.config['name']} v#{Corrupt::VERSION}"
        end
      end

      # GET /code
      def code
        template('main/code.haml')
        return_response
      end

    end # Main

  end # Controllers
end # Corrupt
