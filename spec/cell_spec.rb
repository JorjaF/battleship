require 'rspec'
require './lib/ship'
require './lib/cell'

RSpec.describe Cell do
  it "exists" do
    cell = Cell.new("B4")
    expect(cell).to be_a(Cell)
  end

  xit "has a coordinate" do
    cell = Cell.new("B4")
  end

  xit "can contain a ship"do
    cell = Cell.new("B4")
    expect(cell.ship).to eq(nil)
  end

  xit "can be empty" do
    cell = Cell.new("B4")
    expect(cell.empty?).to eq(true)
  end

  xit "can place_ship" do
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    cell.ship
    expect(cell.empty?).to eq(false)
  end
end