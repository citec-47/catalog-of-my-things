require_relative 'item'

class Genre < Item
  attr_accessor :name
  attr_reader :items

  def initialize(name)
    @name = name
    @items = []
  end

  def self.new_from_hash(hash)
    Genre.new(hash['name'])
  end

  def to_hash
    {
      'name' => @name
    }
  end
end
