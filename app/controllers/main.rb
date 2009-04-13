module Corrupt
  module Controllers

    # Handles the home page and various others.
    class Main < AppController
      def index
        self.content = "#{Corrupt.config['name']} v#{Corrupt::VERSION}"
        return_response
      end

      # GET /articles
      def articles
        @articles = Article.all
        self.content = @articles.inspect
        return_response
      end

      # Handles HTTP 404.
      def four_oh_four
        self.content = 'Not found.'
        return_response(404)
      end
    end # Main

  end # Controllers
end # Corrupt
