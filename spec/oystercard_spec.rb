require "oystercard"


describe OysterCard do
  subject(:card) {described_class.new}
  subject(:card_with_money) {described_class.new.top_up(50)}

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
end
