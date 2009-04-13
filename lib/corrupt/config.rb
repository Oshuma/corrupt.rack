module Corrupt

  # Singleton class to store Corrupt configuration.
  class Config
    include Singleton

    attr_accessor :options

    # Access the configured +key+'s value.
    def self.[](key)
      raise 'Config not setup' unless @setup
      instance.options[key]
    end

    # Setup Config with the YAML +file+.
    def self.setup(file)
      instance.options = YAML.load_file(file)[Corrupt.env]
      @setup = true
    end
  end # Config

end # Corrupt
