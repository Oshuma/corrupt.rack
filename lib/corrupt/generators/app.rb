module Corrupt
  module Generators

    class App

      def initialize(path)
        @path = path
        setup_app!
      end

      private

      def setup_app!
        if File.exists?(@path)
        else
          Dir.mkdir(@path)
        end
      end

    end # App

  end # Generators
end # Corrupt
