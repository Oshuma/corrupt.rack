module Corrupt

  # This class is responsible for setting view variables and rendering a template file.
  class Template
    # TODO: Maybe add a layout option?
    def initialize(file)
      # FIXME: This is rather ugly; maybe raise a 'view not found' exception?
      if file
        view_path = File.join(Corrupt.app_root, 'views')
        @file = File.join(view_path, file)
      else
        @file = File.join(Corrupt.root, 'public', 'index.haml')
      end
      @layout = File.join(Corrupt.app_root, 'views', 'layouts', 'application.haml')
      @variables = {}
    end

    # This captures any key/value pair called on the Template object
    # and saves them for later use in the rendered template file.
    def method_missing(name, *args)
      # Trip the trailing '='
      name = name.to_s.gsub!(/[=]$/, '')
      @variables[name] = args
    end

    # Renders the file with any variables and returns an HTML string.
    # Wraps the file inside of the layout.
    #
    # Currently only supports Haml templates.
    def render
      wrap = Haml::Engine.new(File.read(@layout))
      wrap.render do
        engine = Haml::Engine.new(File.read(@file))
        engine.render(Object.new, @variables)
      end
    end
  end # Template

end # Corrupt
