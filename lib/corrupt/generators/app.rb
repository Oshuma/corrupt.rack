module Corrupt
  module Generators
    autoload :Fileutils, 'fileutils'

    class App

      # A list of directories to create when making a new application.
      DIRS = [
        'app',
        'app/controllers',
        'app/models',
        'app/views',
        'app/views/exceptions',
        'app/views/layouts',
        'app/views/main',
        'config',
        'db',
        'log',
        'public',
        'public/javascripts',
        'public/stylesheets',
        'spec',
        'spec/app',
        'spec/app/controllers',
        'spec/app/models',
        'tasks',
        'tmp',
      ]

      # An array of files to copy for a new application.
      # TODO: This will get ugly.  Maybe move to a Manifest.txt?
      FILES = [
        "#{Corrupt.root}/config.ru",
        "#{Corrupt.root}/corrupt.gemspec",
        "#{Corrupt.root}/Rakefile",
        "#{Corrupt.root}/README",
        "#{Corrupt.root}/app/**/*",
        "#{Corrupt.root}/config/app_config.yml.example",
        "#{Corrupt.root}/config/routes.rb",
        "#{Corrupt.root}/public/**/*",
        "#{Corrupt.root}/spec/**/*",
      ]

      def initialize(path)
        @path = path
        setup_app!
      end

      private

      def setup_app!
        Dir.mkdir(@path) unless File.exists?(@path)
        create_directories
        copy_files
      end

      def create_directories
        DIRS.each do |dir|
          Dir.mkdir(File.join(@path, dir))
        end
      end

      def copy_files
      end

    end # App

  end # Generators
end # Corrupt
