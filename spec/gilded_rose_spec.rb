require 'gilded_rose'

describe GildedRose do
  describe "#update_quality" do

    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end

    it "cannot cause negative values for quality" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].to_s).to eq "foo, -1, 0"
    end

    describe "legendary items" do
      it "update correctly" do
        items = [Item.new("Sulfuras, Hand of Ragnaros", 0, 1)]
        GildedRose.new(items).update_quality()
        expect(items[0].to_s).to eq "Sulfuras, Hand of Ragnaros, 0, 1"
      end
    end

    describe "ticket items" do
      it "update correctly" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 1),
                 Item.new("Backstage passes to a TAFKAL80ETC concert", 9, 1),
                 Item.new("Backstage passes to a TAFKAL80ETC concert", 4, 1)]
        GildedRose.new(items).update_quality()
        expect(items[0].to_s).to eq "Backstage passes to a TAFKAL80ETC concert, 14, 2"
        expect(items[1].to_s).to eq "Backstage passes to a TAFKAL80ETC concert, 8, 3"
        expect(items[2].to_s).to eq "Backstage passes to a TAFKAL80ETC concert, 3, 4"
      end

      it "update past sell-by correctly" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 10)]
        GildedRose.new(items).update_quality()
        expect(items[0].to_s).to eq "Backstage passes to a TAFKAL80ETC concert, -1, 0"
      end

      it "cannot have quality values over 50" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 1, 50)]
        GildedRose.new(items).update_quality()
        expect(items[0].to_s).to eq "Backstage passes to a TAFKAL80ETC concert, 0, 50"
      end
    end

    describe "maturing items" do
      it "update correctly" do
        items = [Item.new("Aged Brie", 1, 1)]
        GildedRose.new(items).update_quality()
        expect(items[0].to_s).to eq "Aged Brie, 0, 2"
      end

      it "update past sell-by correctly" do
        items = [Item.new("Aged Brie", 0, 1)]
        GildedRose.new(items).update_quality()
        expect(items[0].to_s).to eq "Aged Brie, -1, 3"
      end

      it "cannot have quality values over 50" do
        items = [Item.new("Aged Brie", 1, 50)]
        GildedRose.new(items).update_quality()
        expect(items[0].to_s).to eq "Aged Brie, 0, 50"
      end
    end

  end
end
