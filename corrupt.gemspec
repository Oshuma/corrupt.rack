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
  s.rubygems_version = '1.3.1'

  # s.bindir = 'bin'
  # s.executables = ['corrupt']
  s.require_paths = ['lib']
  s.files = FileList[
    'config.ru',
    'Capfile',
    'Rakefile',
    'README',
    'config/app_config.yml.example',
    'config/deploy.rb',
    'config/routes.rb',
    'lib/**/*.rb',
    'spec/lib/**/*.rb',
    'spec/spec_helper.rb',
    'tasks/**/*.rake',
  ]
end
