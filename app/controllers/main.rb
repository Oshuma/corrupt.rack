# Handles the home page and various others.
class Main < AppController

  # GET /
  def index
    template('main/index.haml')
    return_response do |content|
      # This sets 'title' in the template.
      content.title = 'Main Index'
    end
  end

end # Main
