require 'rspec'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'

RSpec.describe Game do
  # if there was time to refactor, we would add a before each do statement here: instantiate a new game and add cells to the player and computer boards; we would also consider adding the ships to the Game class initializer or include them here
  it "exists" do
    game = Game.new
    expect(game).to be_a(Game)
  end

  it "has a main menu" do
    game = Game.new
    
    expect(game.main_menu("p")).to eq("Thank you for playing!")
    expect(game.main_menu("q")).to eq("Thank you for playing!")
    expect(game.main_menu("a")).to eq("Thank you for playing!")
  end

  xit "randomly places the computer ships" do 
    game = Game.new
    game.computer_board.add_cells
    comp_cruiser = Ship.new("Cruiser", 3)
    comp_submarine = Ship.new("Submarine", 2) 

    game.random_placement(comp_submarine)
    game.random_placement(comp_cruiser)
    expect(computer_board.valid_placement?(comp_cruiser, ["(random_placement_coordinate_1)", "(random_placement_coordinate_2)", "(random_placement_coordinate_3)"])).to eq(true)
    expect(board.valid_coordinate?("(random_placement_coordinate_1)")).to eq(true)
    expect(computer_board.valid_placement?(comp_submarine, ["(random_placement_coordinate_1)", "(random_placement_coordinate_2)"])).to eq(true)
    expect(board.valid_coordinate?("(random_placement_coordinate_2)")).to eq(true)
    # # in order to test these, we would have had to create a way to use the return value from the "random_placement" method
  end

  xit "allows the player to place ships" do 
    game = Game.new
    game.player_board.add_cells
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    game.choose_location
    game.player_board.render(true)
    # call render(true) to show the player the board with both ships set
    expect(board.valid_placement?(cruiser, [(chosen_location_coordinate_1), (chosen_location_coordinate_2), (chosen_location_coordinate_3)])).to eq(true)
    expect(board.valid_placement?(submarine, [(chosen_location_coordinate_4), (chosen_location_coordinate_5)])).to eq(true)
    expect((chosen_location_coordinate_1).empty?).to eq(false)
    expect((chosen_location_coordinate_2).ship == (chosen_location_coordinate_3).ship).to eq(true)
    expect(board.not_overlapping?(submarine, [(chosen_location_coordinate_4), (chosen_location_coordinate_5)])).to eq(true)
  end

  xit "takes turns" do
    game = Game.new
    game.computer_board.add_cells
    game.player_board.add_cells
    comp_cruiser = Ship.new("Cruiser", 3)
    comp_submarine = Ship.new("Submarine", 2) 
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    game.random_placement(comp_cruiser)
    game.random_placement(comp_submarine)
    game.choose_location

    game.take_turn 
    expect(game.take_turn).to be_a String
 end

  xit "displays the boards" do
    game = Game.new
    game.computer_board.add_cells
    game.player_board.add_cells
    comp_cruiser = Ship.new("Cruiser", 3)
    comp_submarine = Ship.new("Submarine", 2) 
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    game.random_placement(comp_cruiser)
    game.random_placement(comp_submarine)
    game.choose_location

    expect(game.display_boards).to be_a String
  end

  xit "allows the player to take a shot" do 
    game = Game.new
    game.computer_board.add_cells
    game.player_board.add_cells
    comp_cruiser = Ship.new("Cruiser", 3)
    comp_submarine = Ship.new("Submarine", 2) 
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    game.random_placement(comp_cruiser)
    game.random_placement(comp_submarine)
    game.choose_location
    
    expect(game.player_shot).to be_a String
  end

  xit "randomly chooses a space for the computer shot" do 
    game = Game.new
    game.computer_board.add_cells
    game.player_board.add_cells
    comp_cruiser = Ship.new("Cruiser", 3)
    comp_submarine = Ship.new("Submarine", 2) 
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    game.random_placement(comp_cruiser)
    game.random_placement(comp_submarine)
    game.choose_location

    expect(game.computer_shot).to be_a String
  end

  xit "displays the results of the shots" do 
    game = Game.new
    game.computer_board.add_cells
    game.player_board.add_cells
    comp_cruiser = Ship.new("Cruiser", 3)
    comp_submarine = Ship.new("Submarine", 2) 
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    game.random_placement(comp_cruiser)
    game.random_placement(comp_submarine)
    game.choose_location

    expect(game.shot_results_player("A1")).to be_a String
    expect(game.shot_results_computer("B2")).to be_a String
  end

  xit "can determine if coordinates have already been fired upon" do 
    game = Game.new
    game.computer_board.add_cells
    game.player_board.add_cells
    comp_cruiser = Ship.new("Cruiser", 3)
    comp_submarine = Ship.new("Submarine", 2) 
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    game.random_placement(comp_cruiser)
    game.random_placement(comp_submarine)
    game.choose_location

    expect(game.valid_turn?("A1")).to eq(true)
  end

  xit "can end the game" do 
    game = Game.new
    game.computer_board.add_cells
    game.player_board.add_cells
    comp_cruiser = Ship.new("Cruiser", 3)
    comp_submarine = Ship.new("Submarine", 2) 
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    game.random_placement(comp_cruiser)
    game.random_placement(comp_submarine)
    game.choose_location
    
    expect(game.end_game?).to eq(false)
  end
end
