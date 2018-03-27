describe OysterCard do
  it "has a balance of 0 by default" do
    expect(subject.new.balance).to eq 0
  end
end
