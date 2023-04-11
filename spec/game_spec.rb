require 'rspec'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'

RSpec.describe Game do
  # before each do here
  it "exists" do
    game = Game.new
    expect(game).to be_a(Game)
  end

  it "has a main menu" do
    game = Game.new
    
    expect(game.main_menu).to eq("Invalid input. \n Enter p to play. Enter q to quit.")

    # # When the user starts the game, they should see a welcome message that asks them if they want to play or quit. Whenever a game ends, they should return to this message so they can start a new game, or quit.
# # Welcome to BATTLESHIP
# # Enter p to play. Enter q to quit.
  end

  it "randomly places the computer ships" do 
    game = Game.new
    game.computer_board.add_cells
    comp_cruiser = Ship.new("Cruiser", 3)
    comp_submarine = Ship.new("Submarine", 2) 

    # game.computer_board.place(comp_cruiser, [])

    game.random_placement
    # expect(computer_board.valid_placement?(comp_cruiser, ["A1", "A2", "A3"])).to eq(true)
    # expect(board.valid_coordinate?("A1")).to eq(true)

    # # need to test if the placement is valid but unsure how to do so without knowing what coordinates to pass in

    # computer_board.random_placement(comp_submarine)
    # expect(computer_board.valid_placement?(comp_submarine, ["C2", "D2"])).to eq(true)
    # expect(board.valid_coordinate?("C2")).to eq(true)

    # # need to test if the placement is valid but unsure how to do so without knowing what coordinates to pass in; could use an integration test but the method has already been tested ; integration test would use the return value 


# # Computer Ship Placement
# The computer player should place their ships. The baseline computer should simply use random placements but still adhere to the valid placement rules from iteration 2.
  end

  xit "allows the player to place ships" do 
    game = Game.new
    player_board = Board.new
    player_board.add_cells
    player_board.render
    cruiser = Ship.new("Cruiser", 3)
    player_board.place(cruiser, ["A1", "A2", "A3"])
    player_board.render(true)
    cell_1 = board.cells["A1"]   
    cell_2 = board.cells["A2"]
    cell_3 = board.cells["A3"]  

    expect(cell_1.empty?).to eq(false)
    expect(cell_3.ship == cell_2.ship).to eq(true)
    expect(board.valid_placement?(cruiser, ["A1", "A2", "A3"])).to eq(true)

    submarine = Ship.new("Submarine", 2)
    player_board.place(submarine, ["C4", "D4"])
    player_board.render(true)
    cell_12 = board.cells["C4"]  
    cell_16 = board.cells["D4"]  

    expect(cell_12.empty?).to eq(false)
    expect(cell_12.ship == cell_16.ship).to eq(true)
    expect(board.valid_placement?(cruiser, ["A1", "A2", "A3"])).to eq(true)

    # # Player Ship Placement
# Next, the user places their ships. They should receive a short explanation of how to place along with a visual representation of their board (which should be empty). SHOW EMPTY BOARD

# When the user enters a valid sequence of spaces, the ship should be placed on the board, the new board with the ship should be shown to the user, and then the user should be asked to place the other ship. SHOW BOARD WITH FIRST SHIP PLACED; THEN SHOW BOARD WITH BOTH SHIPS PLACED

# If the user enters an invalid sequence, they should be prompted again:
# Enter the squares for the Submarine (2 spaces):
# > C1 C3
# Those are invalid coordinates. Please try again:
# > A1 B1
# Those are invalid coordinates. Please try again:
# > C1 D1
  end

  xit "takes turns" do
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
