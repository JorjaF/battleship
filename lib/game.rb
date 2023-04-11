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
    # ^different method to start the game
    # user_input = gets.chomp
    if user_input == "p"
      puts "Game on, let's go!"
    elsif user_input == "q"
      puts "Chicken!"
    else 
      puts "Invalid input. \n Enter p to play. Enter q to quit."
    end
    # need to change return value 
  end

  def random_placement
    cell_names = computer_board.cells.keys
    cell_names.rand

    # brute force solution - 
    # chooses first randomly then finds a match
    # the runner lives at the root 

# ensure valid placement

    # take the hash of cells and return an array of keys only
    # return coordinates selected 
  end

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