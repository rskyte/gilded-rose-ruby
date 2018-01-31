require_relative'standard_item'

class MaturingItem < StandardItem
  private
  def increment_quality
    @quality += 1
  end
end
