require 'rspec'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'

RSpec.describe Game do
  # before each do here: instantiate a new game and add cells to the player and computer boards; if there was time to refactor we would also consider adding the ships to the Game class initializer or include them here
  it "exists" do
    game = Game.new
    expect(game).to be_a(Game)
  end

  xit "has a main menu" do
    game = Game.new
    
    expect(game.main_menu("p")).to eq("Thank you for playing!")
    expect(game.main_menu("q")).to eq("Thank you for playing!")
    expect(game.main_menu("a")).to eq("Thank you for playing!")
    # the messages the player receives are different for each input

    # # When the user starts the game, they should see a welcome message that asks them if they want to play or quit. Whenever a game ends, they should return to this message so they can start a new game, or quit.
# # Welcome to BATTLESHIP
# # Enter p to play. Enter q to quit.
  end

  xit "randomly places the computer ships" do 
    game = Game.new
    game.computer_board.add_cells
    comp_cruiser = Ship.new("Cruiser", 3)
    comp_submarine = Ship.new("Submarine", 2) 

    game.random_placement(comp_submarine)
    game.random_placement(comp_cruiser)
    expect(computer_board.valid_placement?(comp_cruiser, ["<random_placement_coordinate_1>", "<random_placement_coordinate_2>", "<random_placement_coordinate_3>"])).to eq(true)
    expect(board.valid_coordinate?("<random_placement_coordinate_1>")).to eq(true)
    expect(computer_board.valid_placement?(comp_submarine, ["<random_placement_coordinate_1>", "<random_placement_coordinate_2>"])).to eq(true)
    expect(board.valid_coordinate?("<random_placement_coordinate_2>")).to eq(true)
    # # in order to test these, we would have had to create a way to use the return value from the "random_placement" method
  end

  xit "allows the player to place ships" do 
    game = Game.new
    game.player_board.add_cells
    player_board.render
    # call render to show the player the board before they place their first ship
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    game.choose_location
    player_board.render(true)
    # call render(true) to show the player the board with both ships set
    expect(board.valid_placement?(cruiser, [<chosen_location_coordinate_1>, <chosen_location_coordinate_2>, <chosen_location_coordinate_3>])).to eq(true)
    expect(board.valid_placement?(submarine, [<chosen_location_coordinate_4>, <chosen_location_coordinate_5>])).to eq(true)
    expect(<chosen_location_coordinate_1>.empty?).to eq(false)
    expect(<chosen_location_coordinate_2>.ship == <chosen_location_coordinate_3>.ship).to eq(true)
    expect(board.not_overlapping?(submarine, [<chosen_location_coordinate_4>, <chosen_location_coordinate_5>])).to eq(true)
  end

  xit "takes turns" do
    game = Game.new
    game.computer_board.add_cells
    game.player_board.add_cells
    comp_cruiser = Ship.new("Cruiser", 3)
    comp_submarine = Ship.new("Submarine", 2) 
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    game.random_placement(comp_submarine)
    game.choose_location


    computer_board = Board.new
    computer_board.random_placement(comp_cruiser)
    computer_board.random_placement(comp_submarine)

    expect(game.take_turn("B3")).to be_a String

# # The Turn

# During the main game, players take turns firing at one another by selecting positions on the grid to attack.

# A single turn consists of:

# Displaying the boards
# Player choosing a coordinate to fire on
# Computer choosing a coordinate to fire on
# Reporting the result of the Player’s shot
# Reporting the result of the Computer’s shot
  end

  xit "displays the boards" do
    game = Game.new

    player_board = Board.new
    player_board.add_cells
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    player_board.place(cruiser, ["A1", "A2", "A3"])
    player_board.place(submarine, ["C4", "D4"])

    computer_board = Board.new
    computer_board.add_cells
    comp_cruiser = Ship.new("Cruiser", 3)
    comp_submarine = Ship.new("Submarine", 2) 
    computer_board.random_placement(comp_cruiser)
    computer_board.random_placement(comp_submarine)

    computer_board.render
    player_board.render(true)

    expect(game.display_boards).to eq()

# # Displaying the Boards
# At the start of the turn, the user is shown both boards. The user should see their ships but not the computer’s ships

# LG note: THIS LIKELY WILL BE A TURN HELPER METHOD
  end

  xit "allows the player to take a shot" do 
    game = Game.new

    player_board = Board.new
    player_board.add_cells
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    player_board.place(cruiser, ["A1", "A2", "A3"])
    player_board.place(submarine, ["C4", "D4"])

    computer_board = Board.new
    computer_board.add_cells
    comp_cruiser = Ship.new("Cruiser", 3)
    comp_submarine = Ship.new("Submarine", 2) 
    computer_board.random_placement(comp_cruiser)
    computer_board.random_placement(comp_submarine)

    expect(game.player_shot("B3")).to be_a String
    # return value = "Your shot on B3 was a miss/hit."

# # Player Shot
# The player should be asked for a coordinate to fire on. If they enter an invalid coordinate, they should be prompted until they enter a valid one

# LG note: THIS LIKELY WILL BE A TURN HELPER METHOD

  end

  xit "randomly chooses a space for the computer shot" do 
    game = Game.new

    player_board = Board.new
    player_board.add_cells
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    player_board.place(cruiser, ["A1", "A2", "A3"])
    player_board.place(submarine, ["C4", "D4"])

    computer_board = Board.new
    computer_board.add_cells
    comp_cruiser = Ship.new("Cruiser", 3)
    comp_submarine = Ship.new("Submarine", 2) 
    computer_board.random_placement(comp_cruiser)
    computer_board.random_placement(comp_submarine)

    expect(game.computer_shot).to be_a String
    # return value = "My shot on <coordinate> was a hit/miss."

    # # Computer Shot
# The computer should choose a random space on the board. The computer should not fire on a space that has already been fired on.

# LG note: THIS LIKELY WILL BE A TURN HELPER METHOD

  end

  xit "displays the results of the shots" do 
    game = Game.new

    player_board = Board.new
    player_board.add_cells
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    player_board.place(cruiser, ["A1", "A2", "A3"])
    player_board.place(submarine, ["C4", "D4"])

    computer_board = Board.new
    computer_board.add_cells
    comp_cruiser = Ship.new("Cruiser", 3)
    comp_submarine = Ship.new("Submarine", 2) 
    computer_board.random_placement(comp_cruiser)
    computer_board.random_placement(comp_submarine)

    expect(game.shot_results).to be_a String

# # Results
# The results of the shots should be displayed

# The game needs to handle all of the following results:

# A shot missed
# A shot hit a ship
# A shot sunk a ship

# LG note: THIS LIKELY WILL BE A TURN HELPER METHOD
# LG note: UPDATE BOARD.RENDER METHOD
  end

  xit "can determine if coordinates have already been fired upon" do 
    game = Game.new

    player_board = Board.new
    player_board.add_cells
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    player_board.place(cruiser, ["A1", "A2", "A3"])
    player_board.place(submarine, ["C4", "D4"])

    computer_board = Board.new
    computer_board.add_cells
    comp_cruiser = Ship.new("Cruiser", 3)
    comp_submarine = Ship.new("Submarine", 2) 
    computer_board.random_placement(comp_cruiser)
    computer_board.random_placement(comp_submarine)

    expect(game.valid_turn("B3")).to eq(true)

# # Coordinates that have already been fired upon
# It is possible that the user enters a coordinate they have already fired upon. You need to add something that informs the user that this is the case. You may choose to either prompt them again for a coordinate they haven’t fired on, or let them choose it again and inform them in the results phase that they selected this coordinate again.

# LG note: THIS LIKELY WILL BE A PLAYER SHOT HELPER METHOD
  end

  xit "can end the game" do 
    game = Game.new
    
    player_board = Board.new
    player_board.add_cells
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    player_board.place(cruiser, ["A1", "A2", "A3"])
    player_board.place(submarine, ["C4", "D4"])

    computer_board = Board.new
    computer_board.add_cells
    comp_cruiser = Ship.new("Cruiser", 3)
    comp_submarine = Ship.new("Submarine", 2) 
    computer_board.random_placement(comp_cruiser)
    computer_board.random_placement(comp_submarine)

# # End Game
# The game is over when either the computer or the user sinks all of the enemy ships. When this happens, the user should see a message stating who won:

# You won!
# or

# I won!

# Then, they should be returned to the Main Menu asking them if they would like to play or quit. (DISPLAY MAIN MENU)
  end


end
