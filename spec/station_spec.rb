require "station"

describe Station do
  subject(:station) {described_class.new(:Baker_Street, 3)}
  it "has a name on creation" do
    expect(station.name).to eq :Baker_Street
  end
  it "has a zone on creation" do
    expect(station.zone).to eq 3
  end
end
