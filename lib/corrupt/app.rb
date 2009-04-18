module Corrupt

  # This is the main Rack app, which is ran through
  #   run Corrupt::App
  class App
    # Returns a proper Rack response in the form of:
    #   [status, headers, content]
    def self.call(env)
      Router.dispatch(env['PATH_INFO'])
    end
  end # App

end # Corrupt
