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

  end
end
