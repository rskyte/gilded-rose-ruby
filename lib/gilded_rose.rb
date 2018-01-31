require_relative 'item'
require_relative 'standard_item'
require_relative 'legendary_item'
require_relative 'maturing_item'
require_relative 'ticket_item'

class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      item.update_item
    end
  end

end
