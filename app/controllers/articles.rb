module Corrupt
  module Controllers

    # Handles the home page and various others.
    class Articles < AppController

      # GET /articles
      def index 
        template('articles/index.haml')
        # FIXME: This ends up as a DataMapper::Collection in the view.
        @articles = Article.all
        return_response do |content|
          content.articles = @articles
        end
      end

    end # Articles

  end # Controllers
end # Corrupt
