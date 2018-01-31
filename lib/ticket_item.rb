require_relative 'standard_item'

class TicketItem < StandardItem
  private
  def update_quality
    increment_quality
    apply_quality_limits
    @quality = 0 if past_sell_by?
  end

  def increment_quality
    @quality += 1 if @sell_in >= 11
    @quality += 2 if @sell_in <= 10 && @sell_in >= 6
    @quality += 3 if @sell_in <= 5
  end
end
