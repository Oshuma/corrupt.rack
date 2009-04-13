module Corrupt

  class Template
    def initialize(file)
      @file = File.join(Corrupt.app_root, 'views', file)
      @variables = {}
    end

    def method_missing(name, *args)
      # Trip the trailing '='
      name = name.to_s.gsub!(/[=]$/, '')
      @variables[name] = args
    end

    # Renders the file with any variables and returns an HTML string.
    def render
      engine = Haml::Engine.new(File.read(@file))
      engine.render(Object.new, @variables)
    end
  end # Template

end # Corrupt
