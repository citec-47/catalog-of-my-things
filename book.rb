require_relative 'item'

class Book < Item
  attr_accessor :title, :author, :cover_state

  def initialize(published_date, title, author, cover_state, genre)
    super(published_date, genre)
    @title = title
    @author = author
    @cover_state = cover_state
  end

  def to_hash
    {
      published_date: @published_date,
      title: @title,
      author: @author,
      cover_state: @cover_state,
      genre: @genre
    }
  end

  def self.new_from_hash(hash)
    new(
      hash['published_date'],
      hash['title'],
      hash['author'],
      hash['cover_state'],
      hash['genre']
    )
  end
end
