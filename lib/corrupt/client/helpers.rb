module Corrupt
  module ClientHelpers

    # Output an error message to +stream+ (defaults to $stderr).
    def error(message, stream = $stderr)
      stream.puts message
    end

    # Output +string+ to +opts[:stream]+ using +opts[:method]+.
    def output(string, opts = {})
      opts[:method] ||= 'puts'
      opts[:stream] ||= $stdout
      opts[:stream].send(opts[:method], string)
    end

    def take_action!
      Corrupt::Generators::App.new(@options[:path]) if @options[:path]
    end

  end # ClientHelpers
end # Corrupt
