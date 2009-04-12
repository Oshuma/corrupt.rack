module Corrupt

  class System
    def initialize
      setup_app_config
      setup_database
    end

    # Class wrapper to the boot! instance method.
    def self.boot!
      new.boot!
    end

    # Setup the Corrupt environment.
    def boot!
    end

    private

    def setup_app_config
      @config = YAML.load_file(Corrupt.config_file)
    end

    def setup_database
      raise 'AppConfig not loaded' unless @config
      database = File.join(Corrupt.root, @config['database'])
      DataMapper.setup(:default, "sqlite3:///#{database}")
      DataMapper.auto_migrate!
    end

  end # System

end # Corrupt
