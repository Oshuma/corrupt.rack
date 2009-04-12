module Corrupt
  module Controllers

    # Handles the home page and various others.
    class Main < AppController
      # GET /
      def index
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
