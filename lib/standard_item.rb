require 'item'

class StandardItem < Item

  def update_item
    update_quality
    increment_sell_by
  end

  private
  def update_quality
    unless @quality >= 50 || @quality <= 0
      qualityMultiplier = past_sell_by? ? 2 : 1
      qualityMultiplier.times { increment_quality }
      @quality = 0 if @quality < 0
    end
  end

  def past_sell_by?
    @sell_in <= 0
  end

  def increment_quality
    @quality -= 1
  end

  def increment_sell_by
    @sell_in -= 1
  end
end
