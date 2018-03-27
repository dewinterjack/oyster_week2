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
      expect(card.deduct(20)).to eq card.balance
    end
  end

  # Implicitly testing in_journey?

  describe "#touch_in" do
    it "changes journey state to true" do
      expect(card.touch_in).to eq card.in_journey?
    end
  end

  describe "#touch_out" do
    it "changes journey state to true" do
      expect(card.touch_out).to eq card.in_journey?
    end
  end


end
