require 'standard_item'

class TicketItem < StandardItem
  private
  def update_quality
    unless @quality >=50 || @quality <= 0
      increment_quality
      @quality = 0 if past_sell_by?
    end
  end

  def increment_quality
    @quality += 1 if @sell_in >= 11
    @quality += 2 if @sell_in <= 10 && @sell_in >= 6
    @quality += 3 if @sell_in <= 5
  end
end
