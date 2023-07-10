require_relative 'item'

class Label
  attr_accessor :title, :items

  def initialize(title)
    @title = title
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def to_hash
    items_hash = @items.map { |item| { name: item.name } }
    { title: @title, items: items_hash }
  end

  def self.new_from_hash(hash)
    Label.new(hash['title'])
  end
end
