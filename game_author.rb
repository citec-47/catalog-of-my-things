require_relative 'item'

# game_author.rb

# game_author.rb

class GameAuthor
  attr_reader :first_name, :last_name

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
  end

  def to_hash
    { first_name: @first_name, last_name: @last_name }
  end

  def self.new_from_hash(hash)
    GameAuthor.new(hash['first_name'], hash['last_name'])
  end
end
