require_relative 'item'
require 'json'

class MusicAlbum < Item
  attr_accessor :name, :on_spotify

  def initialize(published_date, name, genre, on_spotify)
    super(published_date, genre)
    @name = name
    @on_spotify = on_spotify
  end

  def to_hash
    {
      published_date: @published_date,
      name: @name,
      genre: @genre,
      on_spotify: @on_spotify
    }
  end

  def self.new_from_hash(hash)
    new(hash['published_date'], hash['name'], hash['genre'], hash['on_spotify'])
  end
end
