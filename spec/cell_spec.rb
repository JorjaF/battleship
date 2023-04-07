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

  it "can be fired upon" do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)

    cell.place_ship(cruiser)
    expect(cell.ship.health).to eq(3)
    expect(cell.fired_upon?).to eq(false)
    cell.fire_upon
    expect(cell.ship.health).to eq(2)
    expect(cell.fired_upon?).to eq(true)
  end

  xit "can print to the board" do
    cell_1 = Cell.new("B4")

    expect(cell_1.render).to eq(".")
    cell_1.fire_upon
    expect(cell_1.render).to eq("M")
  end

  xit "has an option to show ships" do
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)
    cell_2.place_ship(cruiser)

    expect(cell_2.render).to eq(".")

 # Indicate that we want to show a ship with the optional argument

    expect(cell_2.render(true)).to eq("S")
    cell_2.fire_upon
    expect(cell_2.render).to eq("H")
    expect(cruiser.sunk?).to eq(false)
    cruiser.hit
    cruiser.hit
    expect(cruiser.sunk?).to eq(true)
    expect(cell_2.render).to eq("X")
  end

end