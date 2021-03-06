module Corrupt
  autoload :ClientHelpers, 'corrupt/client/helpers'

  # The Corrupt command-line Client.
  class Client
    include ClientHelpers

    def initialize(argv = ARGV)
      @argv = argv
      @options = {}
    end

    # Class wrapper to the instance method Corrupt::Client#run.
    def self.run
      new.run
    end

    # Handles ARGV input from the client.
    def run
      input = OptionParser.new do |opts|
        opts.banner = "Usage: #{File.basename($0)} [options]"

        opts.on("--debug", "Turn on debugging output.") do |debug|
          $DEBUG = @options[:debug] = debug
        end

        opts.on("-n <path>", "--new", "Create a new Corrupt application.") do |path|
          @options[:path] = path
        end

        opts.on("-v", "--version", "Print the version.") do |v|
          output(Corrupt.to_version)
          exit
        end
      end

      begin
        @argv << '--help' if @argv.empty?
        input.parse!(@argv)
        take_action!
      rescue OptionParser::InvalidOption => error
        error("#{error}\nTry passing '--help'")
      rescue OptionParser::MissingArgument => error
        error("#{error}\nTry passing '--help'")
      end
    end

  end # Client

end # Corrupt
