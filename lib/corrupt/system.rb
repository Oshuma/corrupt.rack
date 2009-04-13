module Corrupt

  # This class is responsible for setting up the Corrupt environment.
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
      prepare_router
      setup_database
    end

    private

    def load_app_config
      Corrupt::Config.setup(Corrupt.config_file)
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

    def prepare_router
      load File.join(Corrupt.root, 'config', 'routes.rb')
    end

    def setup_database
      database = File.join(Corrupt.root, Corrupt::Config['database'])
      DataMapper.setup(:default, "sqlite3:///#{database}")
    end

  end # System

end # Corrupt
