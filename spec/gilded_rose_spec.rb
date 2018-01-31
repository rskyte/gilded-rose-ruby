require 'gilded_rose'

describe GildedRose do
  describe "#update_quality" do

    it "does not change the name" do
      items = [StandardItem.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end

    it "cannot cause negative values for quality" do
      items = [StandardItem.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].to_s).to eq "foo, -1, 0"
    end

    it "calls update_item method on each type of item" do
      items = [StandardItem.new("standard", 0, 0),
               LegendaryItem.new("legendary", 0, 0),
               MaturingItem.new("maturing", 0, 0),
               TicketItem.new("ticket", 0, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].to_s).to eq "standard, -1, 0"
      expect(items[1].to_s).to eq "legendary, 0, 0"
      expect(items[2].to_s).to eq "maturing, -1, 2"
      expect(items[3].to_s).to eq "ticket, -1, 0"
    end

  end
end
