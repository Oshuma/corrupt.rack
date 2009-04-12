module Corrupt
  module Controllers

    # Base controller from which the others inherit.
    class AppController
      attr_writer :headers

      # Return the content (string) to be rendered.
      def content
        @content
      end

      # Set the content to be rendered.
      def content=(new_content)
        @content = new_content
        headers['Content-Length'] = content.size.to_s
      end

      # Return the headers for the response.
      def headers
        { 'Content-Length' => content.size.to_s,
          'Content-Type'   => 'text/plain' }
      end

      # Return the full Rack response in this format:
      #   [status, headers, content]
      # An optional +status+ may be passed; defaults to 200.
      def return_response(status = 200)
        [status, headers, content]
      end
    end # AppController

  end # Controllers
end # Corrupt
