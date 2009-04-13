module Corrupt

  # This is the main Rack app, which is ran through
  #   run Corrupt::App
  class App
    def self.call(env)
      Router.dispatch(env['PATH_INFO'])
    end
  end # App

end # Corrupt
