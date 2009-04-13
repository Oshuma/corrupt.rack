module Corrupt
  module Controllers

    # Handles HTTP error status codes.
    class Exceptions < AppController
      # 404
      def four_oh_four
        self.content = 'Not found.'
        return_response(404)
      end
    end # Exceptions

  end # Controllers
end # Corrupt
