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

    # Setup the Corrupt::Config instance.
    def load_app_config
      Corrupt::Config.setup(Corrupt.config_file)
    end

    # Load any application controllers.
    def load_controllers
      app_controller = "#{Corrupt.app_root}/controllers/app_controller.rb"
      controllers = Dir["#{Corrupt.app_root}/controllers/*.rb"].sort
      # Load AppController first...
      require controllers.delete(app_controller)
      # ...now the rest.
      controllers.each do |controller|
        require controller
      end
    end

    # Load any application models.
    def load_models
      models = Dir["#{Corrupt.app_root}/models/*.rb"].sort
      models.each do |model|
        require model
      end
    end

    # Load the application <tt>/config/routes.rb</tt>.
    def prepare_router
      load File.expand_path(Corrupt.app_root + '/../config/routes.rb')
    end

    # Setup the database connection.
    # TODO: This should only be ran if the application uses a database.
    def setup_database
      database = File.join(Corrupt.app_root, '..', Corrupt::Config['database'])
      DataMapper.setup(:default, "sqlite3:///#{database}")
    end

  end # System

end # Corrupt
