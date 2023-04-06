require 'rspec'
require './lib/ship'

RSpec.describe Ship do
  it "exists" do
    expect(cruiser = Ship.new("Cruiser", 3)).to be_a(Ship)
  end

  it "has attributes" do
    cruiser = Ship.new("Cruiser", 3)
    expect(cruiser.name).to eq("Cruiser")
    # expect(cruiser.length).to eq(3)
  end

  it "has health" do
    cruiser = Ship.new("Cruiser", 3)
    expect(cruiser.health).to eq (3)
  end

  it "can sink" do
    cruiser = Ship.new("Cruiser", 3)
    expect(cruiser.health).to eq (3)
    expect(cruiser.sunk?).to eq (false)
    cruiser.hit
    expect(cruiser.health).to eq (2)
    cruiser.hit
    cruiser.hit
    expect(cruiser.health).to eq(0)
    expect(cruiser.sunk?)
  end

end
