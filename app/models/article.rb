class Article
  include DataMapper::Resource

  property :id, Serial
  # property :user_id, Integer

  property :title, String, :nullable => false
  property :content, Text, :nullable => false

  property :created_at, DateTime
  property :updated_at, DateTime

  # property :created_on, Date
  # property :updated_on, Date

  # belongs_to :user
  # has n, :comments

  # has_tags_on :tags

  # Returns all articles within the given year/month.
  def self.all_by_date(year, month, order = [:created_at.desc])
    year = year.to_i

    start_month = month ? month.to_i : 1
    start_day   = 1
    start_date  = Date.new(year, start_month, start_day)

    end_month = month ? month.to_i : 12
    end_day   = days_in_month(year, end_month)
    end_date  = Date.new(year, end_month, end_day)

    all(:created_at => start_date..end_date, :order => order)
  end

  # Remove Tag objects which no longer belong to an Article.
  # def self.clean_tags
  #   Tag.all.each do |tag|
  #     if self.tagged_with(tag.name).empty?
  #       tag.taggables.each do |article|
  #         Tagging.first(:taggable_id => article.id, :tag_id => tag.id).destroy
  #       end
  #       tag.destroy
  #     end
  #   end
  # end

  # Return the +content+ HTML (rendered through Maruku).
  def content_html
    ::Maruku::new(content).to_html
  end

  # Returns a hash of date attributes and params, used in URL generation.
  def date_params
    date = created_at
    params = { :year => date.year, :month => date.month, :day => date.day,
               :id   => id, :title => url_title }
    params
  end

  # Strips down the title to be used in a URL.
  def url_title
    # Downcase and remove non-alphanumeric characters.
    stripped = title.downcase.gsub(/[^[:alnum:]]/, '-')
    stripped.gsub!(/-{2,}/, '-')  # Remove double hyphens.
    stripped.gsub!(/-{1,}$/, '')  # Remove trailing hyphens.
    stripped
  end

  private

  # Returns the number of days in a given +year+'s +month+.
  def self.days_in_month(year, month)
    (Date.new(year, 12, 31) << (12 - month)).day
  end
end
