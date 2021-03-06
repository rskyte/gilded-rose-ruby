require 'standard_item'

describe StandardItem do
  describe "standard items" do
    it "update correctly" do
      item = StandardItem.new("foo", 1, 1)
      item.update_item
      expect(item.to_s).to eq "foo, 0, 0"
    end

    it "update correctly" do
      item = StandardItem.new("foo", 0, 3)
      item.update_item
      expect(item.to_s).to eq "foo, -1, 1"
    end

    it "updates conjured items correctly" do
      item = StandardItem.new("conjured foo", 0, 3)
      item.update_item
      expect(item.to_s).to eq "conjured foo, -1, 0"
    end
  end
end
