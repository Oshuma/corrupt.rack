module Corrupt
  module Controllers

    # Handles HTTP error status codes.
    class Exceptions < AppController
      # 404
      def four_oh_four
        template('exceptions/404.haml')
        return_response(404)
      end
    end # Exceptions

  end # Controllers
end # Corrupt
