class Game
  attr_reader :computer_board,
              :player_board
            
  def initialize
    @computer_board = Board.new
    @player_board = Board.new
    # @computer_ships = []
    # @player_ships = []
  end

  def main_menu(user_input)
    puts "Welcome to BATTLESHIP \n Enter p to play. Enter q to quit."
    welcome_screen(user_input)
    "Thank you for playing!" 
  end 

  def welcome_screen(user_input)
    if user_input == "p"
      puts "Game on, let's go!"
    elsif user_input == "q"
      puts "Chicken!"
    else 
      puts "Invalid input. \n Enter p to play. Enter q to quit."
    end
  end



  # def random_placement
  #   placement = @computer_board.cruiser(rand 1..2)
  #     if 1 
  #       place_ship == horizontal
  #     else
  #       place_ship == vertical
  #     end
  # end
  
  # tim said that brute force is not our friend in this situation 
  # because it is so hard to test, I am trying the logic method
  # my goal is to first randomize if the ship is vertical or horizontal
  # then use then make sure that the next cell/s should be next to
  # as determined by the randomizer

  # brute force solution - 
  # chooses first randomly then finds a match
  # the runner lives at the root 


  def random_placement(comp_submarine)
    cell_names = computer_board.cells.keys
    coordinates = [cell_names.sample(2)]
    until computer_board.valid_placement?(comp_submarine, coordinates) == false
      coordinates = computer_board.cells.keys.sample(2)
    end
    # computer_board.place(comp_submarine, coordinates)
  end
# LG note: use 'control + c' to exit a loop (if you change false to true in line 53 you will get stuck in a loop)


  # LG note: I went for a brute force solution. Whenever I set line 53 to true (which is what it should be) I get stuck in an infinite loop which tells me it cannot find a valid placement. I still think something is wrong with our valid_placement? method but can't quite figure out what. 
  # LG note: Whenever line 53 is set to false it runs, which tells me the code in the random_placement method works but I am hitting a snag with the valid_placement? method
  # LG note: I am also getting an error on line 56 when I try to place the ship. So perhaps the issue is how I am trying to access the board class from the game class, and not the valid_placement? method itself. 
  # LG note: we can pull line 56 out of this method and place the ship in the spec file instead. This way we can just focus on validating the randomly generated coordinates.

    # brute force solution - 
    # chooses first randomly then finds a match
    # the runner lives at the root 

# ensure valid placement

    # take the hash of cells and return an array of keys only
    # return coordinates selected 
  

  # def random_placement(ship)
  #   placeShip: (size) ->
  #   spans = @freeSquares().filter (span) ->
  #     span.length >= size
  #   span = spans.sample()
  #   throw "The ocean's too crowded" unless span?
  #   # offset = Math.random() * (span.length - size) | 0
  #   squares = span.slice(offset, offset+size)
  #   square.ship = size for square in squares
  #   @ships.push squares

  # shipCoordinates: ->
  #   @ships.map (squares) ->
  #     squares.map (square) ->
  #       [square.x, square.y]
  # require 'pry'; binding.pry
  #   computer_board.cells.keys
  #   keys[rand(keys.size)]

  # end
  
end

# gets.chomp for user input


# # Functionality Checklist
# This checklist summarizes all of the functionality you are expected to build. This will be used to assess the completion of your project:

# Main Menu:

# User is shown the main menu where they can play or quit
# Setup:

# Computer can place ships randomly in valid locations
# User can enter valid sequences to place both ships
# Entering invalid ship placements prompts user to enter valid placements
# Turn:

# User board is displayed showing hits, misses, sunken ships, and ships
# Computer board is displayed showing hits, misses, and sunken ships
# Computer chooses a random shot
# Computer does not fire on the same spot twice
# User can choose a valid coordinate to fire on
# Entering invalid coordinate prompts user to enter valid coordinate
# Both computer and player shots are reported as a hit, sink, or miss
# User is informed when they have already fired on a coordinate
# Board is updated after a turn
# End Game:

# Game ends when all the user’s ships are sunk
# Game ends when all the computer’s ships are sunk
# Game reports who won
# Game returns user back to the Main Menu