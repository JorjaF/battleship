class Game
  attr_reader :computer_board,
              :player_board

  def initialize
    @computer_board = Board.new
    @player_board = Board.new
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
      puts "Chicken,bwak, bwak, bwak!"
    else 
      puts "Invalid input. \n Enter p to play. Enter q to quit."
    end
  end
# ---------------------------------
  # def random_placement(ship)
  #   coordinates = computer_board.cells.keys.sample(2)
  #   if computer_board.valid_placement?(ship, coordinates) == true
  #     computer_board.place(ship, coordinates)
  #   else
  #     random_placement(ship)
  #   end
  #   coordinates
  # end

  def random_placement(ship)
    coordinates = computer_board.cells.keys.sample(2)
    until computer_board.valid_placement?(ship, coordinates)
        
      coordinates = computer_board.cells.keys.sample(2)
    end
    computer_board.place(ship, coordinates)
    coordinates
  end

  # pseudocode: for this method, we were able to pull the cells names out of the @cells hash and put them into an array. We then took a random "sample" of two coordinates and tested if they were a valid placement. If they are a valid pair, we would place them on the board using the "place" method from the board class. If they were not a valid pair, we would call the random placement method again until a valid placement was found. Alternatively, we also tried to use the "until" loop to find a valid pair but got stuck in an infinite loop every time we ran it this way. After finding a valid pair of coordinates and placing them on the board, the method would return the new coordinates so we could use them in the spec file to test this method. We started trying to get this method to run using the submarine (two coordinates) and then if we had gotten it to run correctly, would have updated the method to run for the cruiser (3 coordinates) as well. We could have done this a few ways: a) by using an if/then conditional statement for cruiser vs submarine -or- b) by creating two separate methods (such as "random_placement_sub" and "random_placement_cruiser"). With either approach, for the cruiser method we would have changed "sample(2)" to "sample(3)".

# ---------------------------------

  # def choose_location
  #   puts "I have placed my ships. It is time for you to place your ships. First you will choose a location to place your cruiser. Your cruiser may be placed vertically or horizontally in three (3) consecutive spaces. You may not place your ship diagonally. Please select the three (3) coordinates for your cruiser now."
  #   player_board.render
  #   user_input_cruiser
  # end

  # def user_input_cruiser (helper method for choose_location_cruiser)
  #   if <the user enters three coordinates>.valid_placement?
  #     user_input_submarine
  #   else
  #     puts "Those are invalid coordinates. Please try again"
  #     user_input_cruiser
  #   end
  # end

  # def user_input_submarine (helper method)
  #   player_board.render(true)
  #   puts "Next you will choose a location to place your submarine. Your submarine may be placed vertically or horizontally in two (2) consecutive spaces. You may not place your ship diagonally. Please select the two (2) coordinates for your submarine now." 
  #   if <the user enters two coordinates>.valid_placement?
  #   else
  #     puts "Those are invalid coordinates. Please try again"
  #     user_input_cruiser
  #   end
  # end

  # pseudocode: for this method, the player is given instructions on how to place their ship and is shown an empty board. They are prompted to choose three coordinates for their cruiser. We will run the valid.placement? method to ensure the coordinates chosen are valid. If the coordinates are valid, the user_input_submarine method is called. If the coordinats are not valid the player is prompted to try again. Once the cruiser is succesfully placed, the process is repeated for the player to choose two coordinates for the submarine.

# ---------------------------------
  # def take_turn
  #   display_boards
  #   player_shot
  #   computer_shot
  #   shot_result_player
  #   shot_result_computer
  #   end_game?
  # end

# pseudocode: the take_turn method is used to call six helper methods that will happen each turn:

  # def display_boards
  #   computer_board.render
  #   player_board.render(true)
  # end

# pseudocode: when the take_turn method calls the display_boards method, it will show the computer board (without any ships displayed) and the player's board (with the ships displayed)

  # def player_shot
  #   puts "Take your best shot! Enter a coordinate to take a shot at my ships."
  #   user_input = coordinate
  #   if valid_turn?(user_input)
  #     shot_results_player(user_input)
  #   end
  # end

  # def valid_turn?(user_input)
  #   if user_input.valid_coordinate? == false || cell.render != (".")
  #     puts "That is an invalid coordinate. Please try again."
  #     player_shot
  #   end
  # end

  # pseudocode: when the take_turn method calls the player_shot method, the player will be prompted to enter a coordinate. If the coordinate is not a valid coordinate or if it has already been called, the player will be prompted to provide a new coordinate. If the turn is valid, the shot_results_player method will be called. 
  
  # def shot_results_player(user_input)
  #   if user_input.empty? 
  #     puts "Your shot on #{user_input} was a miss."
  #   elsif user_input.empty? == false && user_input.ship.sunk? 
  #     puts "Your shot on #{user_input} was a hit and you have sunk my ship."
  #   else
  #     puts "Your shot on #{user_input} was a hit."
  #   end
  #   user input
  # end
  
  # pseudocode: the player_shot method calls the shot_results_player method and passes in the valid coordinate called by the player. If the coordinate is empty the user will receive a message letting them know their shot was a miss If the coordinate contains a ship and the ship's health is now 0, they will be told their shot was a hit and they have sunk a ship. If the coordinate contains a ship, they will be told their shot was a hit. Return value will the the coordinate the player chooses.

  # def computer_shot
  #   random_coordinate = computer_board.cells.keys.sample
  #   if cell.render != (".")
  #     computer_shot
  #   end
  #   shot_results_computer(random_coordinate)
  # end

# pseudocode: when the player_shot method calls the computer_shot method, the computer will randomly select one coordinate. If that cell has already been called, it will choose another coordinate. If the coordinate has not been called yet, the shot_results_computer method will be called.

  # def shot_results_computer(random_coordinate)
  #   if random_coordinate.empty? 
  #     puts "My shot on #{random_coordinate} was a miss."
  #   elsif random_coordinate.empty? == false && random_coordinate.ship.sunk? 
  #     puts "My shot on #{random_coordinate} was a hit and I have sunk your ship."
  #   else
  #     puts "My shot on #{random_coordinate} was a hit."
  #   end
  #   random_coordinate
  # end

  # pseudocode: the computer_shot method calls the shot_results_computer method and passes in the valid coordinate randomly chosen by the computer. If the coordinate is empty the user will receive a message letting them know the computer's shot was a miss. If the coordinate contains a ship and the ship's health is now equal to 0, the user will be told their ship was hit and the ship is now sunk. If the coordinate contains a ship, the user will be told the computer's shot was a hit. Return value will be the valid coordinate randomly selected.

  # def end_game?
  #   if comp_cruiser.sunk? && comp_submarine.sunk?
  #     puts "You have sunk all of my ships. You won!"
  #     game.main_menu
  #   elsif cruiser.sunk? && submarine.sunk?
  #     puts "I have sunk all of your ships. I won!"
  #     game.main_menu
  #   else
  #     game.take_turn
  #   end
  # end 

# pseudocode: the end_game? method is called at the end of each turn to determine if the game should end or not. If both of the computer's ships have been sunk, the game will be over and the player will receive a message telling them they have won. If both of the player's ships have been sunk, the game will be over and they will receive a message telling them that the computer has won. If neither the computer's nor the player's ships have all been sunk, the game will continue.
end 
