require 'rspec'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'

RSpec.describe Game do
  it "exists" do
    game = Game.new
    expect(game).to be_a(Game)
  end

  xit "has a main menu" do
    game = Game.new

    # # When the user starts the game, they should see a welcome message that asks them if they want to play or quit. Whenever a game ends, they should return to this message so they can start a new game, or quit.
# # Welcome to BATTLESHIP
# # Enter p to play. Enter q to quit.
  end

  xit "randomly places the computer ships" do 
    game = Game.new

# # Computer Ship Placement
# The computer player should place their ships. The baseline computer should simply use random placements but still adhere to the valid placement rules from iteration 2.

  end

  xit "allows the player to place ships" do 
    game = Game.new

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

# # Displaying the Boards
# At the start of the turn, the user is shown both boards. The user should see their ships but not the computer’s ships

# LG note: THIS LIKELY WILL BE A TURN HELPER METHOD
  end

  xit "allows the player to take a shot" do 
    game = Game.new

# # Player Shot
# The player should be asked for a coordinate to fire on. If they enter an invalid coordinate, they should be prompted until they enter a valid one

# LG note: THIS LIKELY WILL BE A TURN HELPER METHOD

  end

  xit "randomly chooses a space for the computer shot" do 
    game = Game.new

    # # Computer Shot
# The computer should choose a random space on the board. The computer should not fire on a space that has already been fired on.

# LG note: THIS LIKELY WILL BE A TURN HELPER METHOD

  end

  xit "displays the results of the shots" do 
    game = Game.new

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

# # Coordinates that have already been fired upon
# It is possible that the user enters a coordinate they have already fired upon. You need to add something that informs the user that this is the case. You may choose to either prompt them again for a coordinate they haven’t fired on, or let them choose it again and inform them in the results phase that they selected this coordinate again.

# LG note: THIS LIKELY WILL BE A PLAYER SHOT HELPER METHOD
  end

  xit "can end the game" do 
    game = Game.new

# # End Game
# The game is over when either the computer or the user sinks all of the enemy ships. When this happens, the user should see a message stating who won:

# You won!
# or

# I won!

# Then, they should be returned to the Main Menu asking them if they would like to play or quit. (DISPLAY MAIN MENU)
  end


end
