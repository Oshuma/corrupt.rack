module Corrupt
  module Controller

    class Base
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
      # TODO: Save the header hash and allow setting of custom keys.
      def headers
        { 'Content-Length' => content.size.to_s,
          'Content-Type'   => 'text/html' }
      end

      # Return the full Rack response in this format:
      #   [status, headers, content]
      # An optional +status+ may be passed; defaults to 200.
      #
      # An optional block may be passed, which will yield a Corrupt::Template object.
      def return_response(status = 200)
        yield template if block_given?
        self.content = template.render
        [status, headers, content]
      end

      # Set the template file to be rendered or return the Corrupt::Template object.
      def template(file = nil)
        @template ||= Corrupt::Template.new(file)
      end
    end # Base

  end # Controller
end # Corrupt
