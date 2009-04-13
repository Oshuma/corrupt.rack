$LOAD_PATH << File.dirname(__FILE__)

# Dependencies.
begin
  require 'dm-core'
  require 'singleton'
  require 'sqlite3'
  require 'yaml'
rescue LoadError => error
  $stderr.puts error
end

# Corrupt libraries.
require 'corrupt/config'
require 'corrupt/system'

module Corrupt
  VERSION = '0.0.2'

  # Setup the Corrupt environment.
  def self.boot!
    Corrupt::System.boot!
  end

  # This is the main Rack app, which is ran through
  #   run Corrupt::App
  # TODO: Move this to it's own file.
  class App
    def self.call(env)
      # The router.
      case env['PATH_INFO']
      when /^\/$/
        Controllers::Main.new.index
      when /^\/articles\/?$/
        Controllers::Main.new.articles
      else
        # TODO: Exceptions controller, maybe?
        Controllers::Main.new.four_oh_four
      end
    end
  end # App

  private

  def self.app_dir
    ENV['CORRUPT_APP'] || File.dirname(__FILE__) + '/../app'
  end

  def self.config
    Corrupt::Config
  end

  def self.config_file
    ENV['CORRUPT_CONFIG'] || Corrupt.root + '/config/app_config.yml'
  end

  def self.env
    ENV['CORRUPT_ENV'] || 'development'
  end

  def self.root
    ENV['CORRUPT_ROOT'] || File.expand_path(File.dirname(__FILE__) + '/..')
  end

end # Corrupt
