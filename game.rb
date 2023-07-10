require_relative 'item'
require 'date'

class Game < Item
  attr_accessor :single_player, :last_played_at

  def initialize(single_player, last_played_at, published_date)
    super(published_date, nil)
    @single_player = single_player
    @last_played_at = last_played_at
  end

  def to_hash
    {
      single_player: @single_player,
      last_played_at: @last_played_at,
      published_date: @published_date
    }
  end

  def self.new_from_hash(hash)
    new(
      hash['single_player'],
      hash['last_played_at'],
      hash['published_date']
    )
  end
end
