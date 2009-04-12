module Corrupt
  module Controllers

    # Base controller from which the others inherit.
    class AppController
      attr_writer :headers

      def content
        @content
      end

      def content=(new_content)
        @content = new_content
        headers['Content-Length'] = content.size.to_s
      end

      def headers
        { 'Content-Length' => content.size.to_s,
          'Content-Type'   => 'text/plain' }
      end

      def return_response(status = 200)
        [status, headers, content]
      end
    end # AppController

  end # Controllers
end # Corrupt
