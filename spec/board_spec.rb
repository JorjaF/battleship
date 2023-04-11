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
    expect(board.array_length(submarine, ["B2", "B3"])).to eq(true)  
    expect(board.array_length(cruiser, ["C1", "C2", "C3"])).to eq(true)
  end 

  it "can validate ship placement - consecutive coordinates" do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2) 

    expect(board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to eq(false)
    expect(board.valid_placement?(submarine, ["A1", "C1"])).to eq(false)
    expect(board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to eq(false)
    expect(board.valid_placement?(submarine, ["C1", "B1"])).to eq(false)
    expect(board.consecutive_coordinates(cruiser, ["B1", "B2", "B3"])).to eq(true)
    expect(board.consecutive_coordinates(submarine, ["B1", "C1"])).to eq(true)
  end 

  it "can validate ship placement - not diagnol" do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2) 

    expect(board.valid_placement?(cruiser, ["A1", "B2", "C3"])).to eq(false)
    expect(board.valid_placement?(submarine, ["C2", "D3"])).to eq(false)
    expect(board.horizontal(cruiser, ["D1", "D2", "D3"])).to eq(true)
    expect(board.horizontal(submarine, ["C2", "C3"])).to eq(true)
    expect(board.vertical(cruiser, ["A1", "B1", "C1"])).to eq(true)
    expect(board.vertical(submarine, ["C2", "D2"])).to eq(true)
  end 

  it "can validate ship placement" do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2) 
    
    expect(board.valid_placement?(submarine, ["A1", "A2"])).to eq(true)
    expect(board.valid_placement?(cruiser, ["B1", "C1", "D1"])).to eq(true)
  end

  it "can place a ship" do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    board.add_cells
    
    board.place(cruiser, ["A1", "A2", "A3"])
    cell_1 = board.cells["A1"]   
    cell_2 = board.cells["A2"]
    cell_3 = board.cells["A3"]   
 
    expect(cell_1.ship).to be_a(Ship)
    expect(cell_2.ship).to be_a(Ship)
    expect(cell_3.ship).to be_a(Ship)
    expect(cell_3.ship == cell_2.ship).to eq(true)
  end

  it "can check for overlapping ships" do
    board = Board.new
    board.add_cells
    cruiser = Ship.new("Cruiser", 3)
    board.place(cruiser, ["A1", "A2", "A3"])
    submarine = Ship.new("Submarine", 2)
    expect(board.valid_placement?(submarine, ["A1", "B1"])).to eq(false)
    expect(board.not_overlapping?(submarine, ["A1", "B1"])).to eq(false)
  end

  it "can render the board" do 
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)    
    board.add_cells
    board.place(cruiser, ["A1", "A2", "A3"])   
    cell_1 = board.cells["A1"]   
    cell_2 = board.cells["A2"]
    cell_3 = board.cells["A3"]

    expect(board.render).to eq("  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n")
    expect(board.render(true)).to eq("  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n")
  end
end
  # As you move forward, you will need to add functionality to your game so that you can fire on Cells and damage their Ships. When you do this, you should also add new tests for your render method that it can render with Hits, Misses, and Sunken Ships. See Iteration 2 requirements for examples of what it could look like
