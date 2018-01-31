require 'standard_item'

class MaturingItem < StandardItem
  private
  def update_quality
    unless @quality >= 50 || @quality <= -1
      qualityMultiplier = past_sell_by? ? 2 : 1
      qualityMultiplier.times { increment_quality }
      @quality = 0 if @quality < 0
    end
  end

  def increment_quality
    @quality += 1
  end
end
