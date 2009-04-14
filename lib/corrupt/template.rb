module Corrupt

  class Template
    # If <tt>options[:public]</tt> is passed, the file will be searched
    # for in /public, else /app/views.
    #
    # FIXME: Remove the /public check when Rack::Static is finished.
    def initialize(file, options = {})
      if options[:public]
        path = File.join(Corrupt.root, 'public')
      else
        path = File.join(Corrupt.app_root, 'views')
      end
      @file   = File.join(path, file)
      @layout = File.join(Corrupt.app_root, 'views', 'layouts', 'application.haml')
      @variables = {}
    end

    def method_missing(name, *args)
      # Trip the trailing '='
      name = name.to_s.gsub!(/[=]$/, '')
      @variables[name] = args
    end

    # Renders the file with any variables and returns an HTML string.
    # Wraps the file inside of the layout.
    def render
      wrap = Haml::Engine.new(File.read(@layout))
      wrap.render do
        engine = Haml::Engine.new(File.read(@file))
        engine.render(Object.new, @variables)
      end
    end
  end # Template

end # Corrupt
