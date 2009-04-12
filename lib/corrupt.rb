$LOAD_PATH << File.dirname(__FILE__)

# Dependencies.
begin
  require 'dm-core'
  require 'sqlite3'
  require 'yaml'
rescue LoadError => error
  $stderr.puts error
end

# Corrupt libraries.
require 'corrupt/system'

module Corrupt
  VERSION = '0.0.1'

  def self.boot!
    Corrupt::System.boot!
  end

  # TODO: Move this to it's own file.
  class App
    def self.call(env)
      # The router.
      case env['PATH_INFO']
      when /^\/$/
        Controllers::Main.new.index
      else
        Controllers::Main.new.four_oh_four
      end
    end
  end # App

  private

  def self.app_dir
    ENV['CORRUPT_APP'] || File.dirname(__FILE__) + '/../app'
  end

  def self.config_file
    ENV['CORRUPT_CONFIG'] || Corrupt.root + '/config/app_config.yml'
  end

  def self.root
    ENV['CORRUPT_ROOT'] || File.expand_path(File.dirname(__FILE__) + '/..')
  end

end # Corrupt
