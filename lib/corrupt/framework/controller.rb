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
      def headers
        { 'Content-Length' => content.size.to_s,
          'Content-Type'   => 'text/html' }
      end

      # Return the full Rack response in this format:
      #   [status, headers, content]
      # An optional +status+ may be passed; defaults to 200.
      def return_response(status = 200)
        yield template if block_given?
        self.content = template.render
        [status, headers, content]
      end

      # Set the template to be rendered.
      def template(file = nil)
        @template ||= Corrupt::Template.new(file)
      end
    end # Base

  end # Controller
end # Corrupt
