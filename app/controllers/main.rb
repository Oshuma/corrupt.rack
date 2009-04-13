module Corrupt
  module Controllers

    # Handles the home page and various others.
    class Main < AppController
      def index
        template('main/index.haml')
        return_response do |content|
          content.title = 'Main Index'
          content.version = "#{Corrupt.config['name']} v#{Corrupt::VERSION}"
        end
      end

      # GET /articles
      def articles
        template('main/articles.haml')
        return_response do |response|
          response.articles = Article.all
        end
      end

    end # Main

  end # Controllers
end # Corrupt
