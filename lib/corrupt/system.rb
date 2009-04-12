module Corrupt

  class System
    def initialize
      load_app_config
    end

    # Class wrapper to the boot! instance method.
    def self.boot!
      new.boot!
    end

    # Setup the Corrupt environment.
    def boot!
      load_models
      load_controllers
      setup_database
    end

    private

    def load_app_config
      @config = YAML.load_file(Corrupt.config_file)
    end

    def load_controllers
      controllers = Dir["#{Corrupt.app_dir}/controllers/*.rb"].sort
      controllers.each do |controller|
        require controller
      end
    end

    def load_models
      models = Dir["#{Corrupt.app_dir}/models/*.rb"].sort
      models.each do |model|
        require model
      end
    end

    def setup_database
      raise 'AppConfig not loaded' unless @config
      database = File.join(Corrupt.root, @config['database'])
      DataMapper.setup(:default, "sqlite3:///#{database}")
    end

  end # System

end # Corrupt
