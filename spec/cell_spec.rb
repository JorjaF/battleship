require 'rspec'
require './lib/ship'
require './lib/cell'

RSpec.describe Cell do
  it "exists" do
    cell = Cell.new("B4")
    expect(cell).to be_a(Cell)
  end

  it "has a coordinate" do
    cell = Cell.new("B4")
    expect(cell.coordinate).to eq("B4")
  end

  it "can contain a ship"do
    cell = Cell.new("B4")
    expect(cell.ship).to eq(nil)
  end

  it "can be empty" do
    cell = Cell.new("B4")
    expect(cell.empty?).to eq(true)
  end

  it "can place_ship" do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    expect(cell.empty?).to eq(true)
    cell.place_ship(cruiser)
    cell.ship
    expect(cell.empty?).to eq(false)
  end
end