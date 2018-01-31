require 'ticket_item'

describe TicketItem do

  describe "ticket items" do
    it "update correctly" do
      tickets = [TicketItem.new("Backstage passes to a TAFKAL80ETC concert", 15, 1),
                 TicketItem.new("Backstage passes to a TAFKAL80ETC concert", 9, 1),
                 TicketItem.new("Backstage passes to a TAFKAL80ETC concert", 4, 1)]
      tickets.each { |ticket| ticket.update_item }
      expect(tickets[0].to_s).to eq "Backstage passes to a TAFKAL80ETC concert, 14, 2"
      expect(tickets[1].to_s).to eq "Backstage passes to a TAFKAL80ETC concert, 8, 3"
      expect(tickets[2].to_s).to eq "Backstage passes to a TAFKAL80ETC concert, 3, 4"
    end

    it "update past sell-by correctly" do
      ticket = TicketItem.new("Backstage passes to a TAFKAL80ETC concert", 0, 10)
      ticket.update_item
      expect(ticket.to_s).to eq "Backstage passes to a TAFKAL80ETC concert, -1, 0"
    end

    it "cannot have quality values over 50" do
      ticket = TicketItem.new("Backstage passes to a TAFKAL80ETC concert", 1, 50)
      ticket.update_item
      expect(ticket.to_s).to eq "Backstage passes to a TAFKAL80ETC concert, 0, 50"
    end
  end

end
