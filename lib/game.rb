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

  # def random_placement(ship)
  #   coordinates = computer_board.cells.keys.sample(2)
  #   if computer_board.valid_placement?(ship, coordinates) == true
  #     computer_board.place(ship, coordinates)
  #   else
  #     random_placement(ship)
  #   end
  #   coordinates
  # end

  # def random_placement(ship)
  #   cell_names = computer_board.cells.keys
  #   coordinates = [cell_names.sample(2)]
  #   until computer_board.valid_placement?(ship, coordinates) == true
  #     coordinates = computer_board.cells.keys.sample(2)
  #   end
  #   # computer_board.place(ship, coordinates)
  #   coordinates
  # end

  # pseudocode: for this method, we were able to pull the cells names out of the @cells hash and put them into an array. We then took a random "sample" of two coordinates and tested if they were a valid placement. If they are a valid pair, we would place them on the board using the "place" method from the board class. If they were not a valid pair, we would call the random placement method again until a valid placement was found. Alternatively, we also tried to use the "until" loop to find a valid pair but got stuck in an infinite loop every time we ran it this way. After finding a valid pair of coordinates and placing them on the board, the method would return the new coordinates so we could use them in the spec file to test this method. We started trying to get this method to run using the submarine (two coordinates) and then if we had gotten it to run correctly, would have updated the method to run for the cruiser (3 coordinates) as well. We could have done this a few ways: a) by using an if/then conditional statement for cruiser vs submarine -or- b) by creating two separate methods (such as "random_placement_sub" and "random_placement_cruiser"). With either approach, for the cruiser method we would have changed "sample(2)" to "sample(3)".

  def choose_location
    puts "I have placed my ships. It is time for you to place your ships. First you will choose a location to place your cruiser. Your cruiser may be placed vertically or horizontally in three (3) consecutive spaces. You may not place your ship diagonally. Please select the three (3) coordinates for your cruiser now."
    player_board.render
    user_input_cruiser
  end

  def user_input_cruiser (helper method for choose_location_cruiser)
    if <the user enters three coordinates>.valid_placement?
      user_input_submarine
    else

    end
  end

  def user_input_submarine
    player_board.render(true)
    puts "Next you will choose a location to place your submarine. Your submarine may be placed vertically or horizontally in two (2) consecutive spaces. You may not place your ship diagonally. Please select the two (2) coordinates for your submarine now." 

  end
  

# When the user enters a valid sequence of spaces, the ship should be placed on the board, the new board with the ship should be shown to the user, and then the user should be asked to place the other ship. SHOW BOARD WITH FIRST SHIP PLACED; THEN SHOW BOARD WITH BOTH SHIPS PLACED

# If the user enters an invalid sequence, they should be prompted again:
# Enter the squares for the Submarine (2 spaces):
# > C1 C3
# Those are invalid coordinates. Please try again:
# > A1 B1
# Those are invalid coordinates. Please try again:
# > C1 D1

  
  
  
  
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