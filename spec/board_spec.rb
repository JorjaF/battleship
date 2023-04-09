require 'rspec'
require './lib/ship'
require './lib/cell'
require './lib/board'

RSpec.describe Board do
  it "exists" do
    board = Board.new
    expect(board).to be_a(Board)
  end

  it "contains cells" do
    board = Board.new

    expect(board.cells).to eq({})
    board.add_cells
    expect(board.cells).to be_a Hash
    expect(board.cells.count).to eq(16)
  end

  it "can tell us if a coordinate is on the board" do
    board = Board.new
    board.add_cells

    expect(board.valid_coordinate?("A1")).to eq(true)
    expect(board.valid_coordinate?("D4")).to eq(true)
    expect(board.valid_coordinate?("A5")).to eq(false)
    expect(board.valid_coordinate?("E1")).to eq(false)
    expect(board.valid_coordinate?("A22")).to eq(false)
  end

  it "can validate ship placement - array length" do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2) 

    expect(board.valid_placement?(cruiser, ["A1", "A2"])).to eq(false)
    expect(board.valid_placement?(submarine, ["A2", "A3", "A4"])).to eq(false)
  end 

  it "can validate ship placement - consecutive coordinates" do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2) 

    expect(board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to eq(false)
    expect(board.valid_placement?(submarine, ["A1", "C1"])).to eq(false)
    expect(board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to eq(false)
    expect(board.valid_placement?(submarine, ["C1", "B1"])).to eq(false)
  end 

  it "can validate ship placement - not diagnol" do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2) 

    expect(board.valid_placement?(cruiser, ["A1", "B2", "C3"])).to eq(false)
    expect(board.valid_placement?(submarine, ["C2", "D3"])).to eq(false)
  end 

  xit "can validate ship placement" do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2) 

    expect(board.valid_placement?(submarine, ["A1", "A2"])).to eq(true)
    expect(board.valid_placement?(cruiser, ["B1", "C1", "D1"])).to eq(true)
  end

  xit "can place a ship" do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)

    board.place(cruiser, ["A1", "A2", "A3"])
    cell_1 = board.cells["A1"]   
    cell_2 = board.cells["A2"]
    cell_3 = board.cells["A3"]   
 
    expect(cell_1.ship).to be_a(Ship)
    expect(cell_2.ship).to be_a(Ship)
    expect(cell_3.ship).to be_a(Ship)
    expect(cell_3.ship == cell_2.ship).to eq(true)
  end

  xit "can check for overlapping ships" do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    board.place(cruiser, ["A1", "A2", "A3"])
    submarine = Ship.new("Submarine", 2)

    expect(board.valid_placement?(submarine, ["A1", "B1"])).to eq(false)
  end

end


    # cell_1 = Cell.new("A1")
    # cell_2 = Cell.new("A2")
    # cell_3 = Cell.new("A3")
    # cell_4 = Cell.new("A4")
    # cell_5 = Cell.new("B1")
    # cell_6 = Cell.new("B2")
    # cell_7 = Cell.new("B3")
    # cell_8 = Cell.new("B4")
    # cell_9 = Cell.new("C1")
    # cell_10 = Cell.new("C2")
    # cell_11 = Cell.new("C3")
    # cell_12 = Cell.new("C4")
    # cell_13 = Cell.new("D1")
    # cell_14 = Cell.new("D2")
    # cell_15 = Cell.new("D3")
    # cell_16 = Cell.new("D4")
