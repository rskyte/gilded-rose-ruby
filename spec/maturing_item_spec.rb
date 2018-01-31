require 'maturing_item'

describe MaturingItem do

  describe "maturing items" do
    it "update correctly" do
      item = MaturingItem.new("Aged Brie", 1, 1)
      item.update_item
      expect(item.to_s).to eq "Aged Brie, 0, 2"
    end

    it "update past sell-by correctly" do
      item = MaturingItem.new("Aged Brie", 0, 0)
      item.update_item
      expect(item.to_s).to eq "Aged Brie, -1, 2"
    end

    it "cannot have quality values over 50" do
      item = MaturingItem.new("Aged Brie", 1, 50)
      item.update_item
      expect(item.to_s).to eq "Aged Brie, 0, 50"
    end
  end

end
