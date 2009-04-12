module Corrupt
  module Controllers

    class Main < AppController
      def index
        @articles = Article.all
        self.content = @articles.inspect
        return_response
      end

      def four_oh_four
        self.content = 'Not found.'
        return_response(404)
      end
    end # Main

  end # Controllers
end # Corrupt
