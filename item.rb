require 'date'

class Item
  attr_accessor :published_date, :genre, :label, :author

  def initialize(published_date, genre)
    @published_date = published_date
    @genre = genre
    @label = nil
    @author = nil
  end

  # Other methods for item management
end
