$LOAD_PATH << File.dirname(__FILE__)

begin
  require 'dm-core'
  require 'sqlite3'
  require 'yaml'
rescue LoadError => error
  $stderr.puts error
end

module Corrupt
  VERSION = '0.0.1'

  # TODO: Move this to it's own file.
  class App
    def self.call(env)
      # The router.
      case env['PATH_INFO']
      when /^\/$/
        [200, {'Content-Type' => 'text/plain', 'Content-Length' => '7'}, 'corrupt']
      else
        [
          404,
          { 'Content-Type' => 'text/plain', 'Content-Length' => '10' },
          'Not found.'
        ]
      end
    end
  end # App

  # Setup the Corrupt environment.
  def self.boot!
    setup_app_config
    setup_database
  end

  private

  def self.app_dir
    ENV['CORRUPT_APP'] || File.dirname(__FILE__) + '/../app'
  end

  def self.config_file
    default_config = File.dirname(__FILE__) + '/../config/app_config.yml'
    ENV['CORRUPT_CONFIG'] || default_config
  end

  def self.root
    ENV['CORRUPT_ROOT'] || File.expand_path(File.dirname(__FILE__) + '/..')
  end

  def self.setup_app_config
    @config = YAML.load_file(config_file)
  end

  def self.setup_database
    raise 'AppConfig not loaded' unless @config
    database = File.join(Corrupt.root, @config['database'])
    DataMapper.setup(:default, "sqlite3:///#{database}")
    DataMapper.auto_migrate!
  end
end # Corrupt
