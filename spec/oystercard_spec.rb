require "oystercard"

describe OysterCard do
  subject(:card) {described_class.new}

  it "has a balance of 0 by default" do
    expect(card.balance).to eq 0
  end

  describe "#top_up" do
    it "adds money to balance" do
      expect(card.top_up(10)).to eq card.balance
    end
    it "raises error when max limit is reached (£90)" do
      expect{card.top_up(100)}.to raise_error "Max limit exceeded."
    end
  end

  describe "#deduct" do
    it "deducts money from balance" do
      expect(card.send(:deduct, 20)).to eq card.balance
    end
  end

  # Implicitly testing in_journey?
  describe "#touch_in" do
    it "raises error when balance is not at least £1" do
      expect{card.touch_in(:Baker_Street)}.to raise_error "Balance is lower than mimimum (£1)"
    end
    it "remembers the entry station" do
      card.top_up(40)
      card.touch_in(:Baker_Street)
      expect(:Baker_Street).to eq card.entry
    end

  end

  describe "#touch_out" do
    it "changes journey state to false" do
      card.touch_out(:Aldgate)
      expect(card.in_journey?).to eq false
    end
    it "deducts mimimum fare" do
      expect{card.touch_out(:Aldgate)}.to change{card.balance}.by(-OysterCard::MIN_FARE)
    end
    it "forgets entry station" do
      card.top_up(30)
      card.touch_in(:Baker_Street)
      card.touch_out(:Aldgate)
      expect(card.entry).to eq nil
    end
    it "saves entry & exit stations inside a hash (journey history)" do
      card.top_up(30)
      card.touch_in(:Baker_Street)
      card.touch_out(:Aldgate)
      expect(card.history[-1]).to eq ({:entry=>:Baker_Street, :exit=>:Aldgate})
    end
  end

end
