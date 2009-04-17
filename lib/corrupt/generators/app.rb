module Corrupt
  module Generators
    # autoload :Fileutils, 'fileutils'

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
        'public/images',
        'public/javascripts',
        'public/stylesheets',
        'spec',
        'spec/app',
        'spec/app/controllers',
        'spec/app/models',
        'tasks',
        'tmp',
      ]

      # A list of files to copy for a new application.
      FILES = [
        'config.ru',
        'Rakefile',
        'README',
        'app/controllers/app_controller.rb',
        'app/controllers/exceptions.rb',
        'app/controllers/main.rb',
        'app/models/page.rb',
        'app/views/exceptions/404.haml',
        'app/views/layouts/application.haml',
        'app/views/main/index.haml',
        'config/app_config.yml.example',
        'config/routes.rb',
        'public/images/ruby-powered.png',
        'public/javascripts/application.js',
        'public/stylesheets/application.css',
        'public/favicon.ico',
        'public/index.haml',
        'spec/app/controllers/app_controller_spec.rb',
        'spec/app/controllers/main_spec.rb',
        'spec/app/models/page_spec.rb',
        'spec/app/app_spec_helper.rb',
        'spec/rcov.opts',
        'spec/spec.opts',
        'spec/spec_helper.rb',
        'tasks/app.rake',
        'tasks/gem.rake',
        'tasks/notes.rake',
        'tasks/spec.rake',
        'tasks/util.rake',
      ]

      def initialize(path)
        @path = File.expand_path(path)
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
        FILES.each do |file|
          base_file = File.expand_path(File.join(Corrupt.root, file))
          Dir.chdir(@path) do |app_root|
            base_path = File.dirname(file)
            destination = File.join(app_root, file)
            copy_command = "cp #{base_file} #{destination}"
            %x/#{copy_command}/
          end
        end
      end

    end # App

  end # Generators
end # Corrupt
