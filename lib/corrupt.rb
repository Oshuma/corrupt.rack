$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__))

# Dependencies.
begin
  require 'dm-core'
  require 'dm-timestamps'
  require 'haml'
  require 'logger'
  require 'maruku'
  require 'singleton'
  require 'sqlite3'
  require 'yaml'
rescue LoadError => error
  $stderr.puts error
end

# Corrupt core libraries.
require 'corrupt/app'
require 'corrupt/config'
require 'corrupt/router'
require 'corrupt/system'
require 'corrupt/template'

# Corrupt generators.
require 'corrupt/generators'

# Corrupt framework libraries.
require 'corrupt/framework/controller'

module Corrupt
  VERSION = '0.3.4'

  # Setup the Corrupt environment.
  def self.boot!
    Corrupt::System.boot!
  end

  # Output a version string.
  def self.to_version
    "Corrupt v#{VERSION}"
  end

  private

  def self.app_root
    ENV['CORRUPT_APP'] || File.join(Dir.pwd, 'app')
  end

  def self.config
    Corrupt::Config
  end

  def self.config_file
    ENV['CORRUPT_CONFIG'] || Corrupt.app_root + '/../config/app_config.yml'
  end

  def self.env
    ENV['CORRUPT_ENV'] || 'development'
  end

  def self.log
    @log ||= Logger.new("#{Corrupt.app_root}/../log/#{Corrupt.env}.log")
    @log.level = (Corrupt.env == 'production' ? Logger::WARN : Logger::DEBUG)
    @log
  end

  def self.root
    ENV['CORRUPT_ROOT'] || File.expand_path(File.dirname(__FILE__) + '/..')
  end

end # Corrupt
