require_relative 'item'

class StandardItem < Item

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
    @quality = 0 if @quality < 0
    @quality = 50 if @quality > 50
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
