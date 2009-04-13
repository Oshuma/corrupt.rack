module Corrupt

  # This is the main Rack app, which is ran through
  #   run Corrupt::App
  class App
    def self.call(env)
      # The router.
      case env['PATH_INFO']
      when /^\/$/
        Controllers::Main.new.index
      when /^\/articles\/?$/
        Controllers::Main.new.articles
      else
        # TODO: Exceptions controller, maybe?
        Controllers::Main.new.four_oh_four
      end
    end
  end # App

end # Corrupt