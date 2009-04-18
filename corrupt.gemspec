require File.dirname(__FILE__) + '/lib/corrupt'

require 'rake'

Gem::Specification.new do |s|
  s.name = 'corrupt'
  s.version = '0.3.6'
  s.authors = ['Dale Campbell']
  s.email = ['dale@save-state.net']
  s.homepage = 'http://github.com/Oshuma/corrupt.rack/'
  s.date = Time.now.strftime("%Y-%m-%d")
  s.summary = 'Rack-based MVC framework.'
  s.description = 'No nonsense Rack-based framework.'

  s.has_rdoc = true
  s.extra_rdoc_files = ['README']
  s.rdoc_options << '--title' << 'Corrupt API' << '--main' << 'README' << '--inline-source' << '--line-numbers'

  s.rubyforge_project = 'corrupt'
  s.rubygems_version = '1.3.1'

  s.bindir = 'bin'
  s.executables = ['corrupt']
  s.default_executable = 'corrupt'
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

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<dm-core>, [">= 0.9.11"])
      s.add_runtime_dependency(%q<haml>, [">= 2.0.9"])
    else
      s.add_dependency(%q<dm-core>, [">= 0.9.11"])
      s.add_dependency(%q<haml>, [">= 2.0.9"])
    end
  else
    s.add_dependency(%q<dm-core>, [">= 0.9.11"])
    s.add_dependency(%q<haml>, [">= 2.0.9"])
  end
end
