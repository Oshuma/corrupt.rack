require File.dirname(__FILE__) + '/lib/corrupt'

require 'rake'

Gem::Specification.new do |s|
  s.name = 'corrupt'
  s.version = Corrupt::VERSION
  s.authors = ['Dale Campbell']
  s.email = ['dale@save-state.net']
  s.homepage = 'http://corrupt.save-state.net/'
  s.date = Time.now.strftime("%Y-%m-%d")
  s.summary = 'Rack-based MVC framework.'
  s.description = 'No nonsense Rack-based framework.'

  s.rubyforge_project = 'corrupt'
  s.rubygems_version >= '1.3.1'

  s.bindir = 'bin'
  s.executables = ['corrupt']
  s.require_paths = ['lib']
  s.files = FileList[
    'Rakefile',
    'README',
    'app/**/*.rb',
    'app/**/*.haml',
    'config.ru',
    'config/app_config.yml.example',
    'config/routes.rb',
    'lib/**/*.rb',
    'public/images/**/*',
    'public/javascripts/application.js',
    'public/stylesheets/application.css',
    'public/favicon.ico',
    'public/index.haml',
    'spec/app/**/*.rb',
    'spec/lib/**/*.rb',
    'spec/rcov.opts',
    'spec/spec.opts',
    'spec/spec_helper.rb',
    'tasks/**/*.rake',
  ]
end
