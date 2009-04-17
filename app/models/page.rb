# This is an application model and will get loaded into the
# global namespace.  Corrupt uses DataMapper by default,
# however, a model can be any Ruby class.
class Page
  attr_accessor :title, :content

  def initialize(title)
    @title   = title
    @content = ''
  end
end
