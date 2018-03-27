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
    it "changes journey state to true" do
      card.top_up(20)
      expect(card.touch_in).to eq card.in_journey?
    end
    it "raises error when balance is not at least £1" do
      expect{card.touch_in}.to raise_error "Balance is lower than mimimum (£1)"
    end
  end

  describe "#touch_out" do
    it "changes journey state to false" do
      card.touch_out
      expect(card.in_journey?).to eq false
    end
    it "deducts mimimum fare" do
      expect{card.touch_out}.to change{card.balance}.from(card.balance).to(card.balance - OysterCard::MIN_FARE)
    end
  end

end
