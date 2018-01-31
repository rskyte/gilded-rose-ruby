require_relative 'item'

class StandardItem < Item
  MAXIMUM_QUALITY = 50
  MINIMUM_QUALITY = 0
  
  def update_item
    update_quality
    increment_sell_by
  end

  private
  def update_quality
    quality_multiplier = calculate_quality_multiplier
    quality_multiplier.times { increment_quality }
    apply_quality_limits
  end

  def apply_quality_limits
    @quality = MINIMUM_QUALITY if @quality < MINIMUM_QUALITY
    @quality = MAXIMUM_QUALITY if @quality > MAXIMUM_QUALITY
  end

  def calculate_quality_multiplier
    quality_multiplier = past_sell_by? ? 2 : 1
    quality_multiplier *= 2 if is_conjured?
    quality_multiplier
  end

  def is_conjured?
    tag = @name.split(" ")[0]
    tag == "conjured" || tag == "Conjured"
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
