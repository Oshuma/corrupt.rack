# Handles HTTP error status codes.
class Exceptions < AppController

  # HTTP 404
  def four_oh_four
    template('exceptions/404.haml')
    return_response(404)
  end

end # Exceptions
