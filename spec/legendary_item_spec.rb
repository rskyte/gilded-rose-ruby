require 'legendary_item'

describe LegendaryItem do

  describe "legendary items" do
    it "update correctly" do
      item = LegendaryItem.new("Sulfuras, Hand of Ragnaros", 0, 1)
      item.update_item
      expect(item.to_s).to eq "Sulfuras, Hand of Ragnaros, 0, 1"
    end
  end

end
