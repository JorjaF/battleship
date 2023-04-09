class Board
  attr_reader :cells
            
  def initialize
    @cells = {}
  end

  # def add_cell(cell)
  #   @cells = {
  #     cell.coordinate => cell
  #   }
  # end

  def add_cells
    @cells = {
      "A1" => Cell.new("A1"),
      "A2" => Cell.new("A2"),
      "A3" => Cell.new("A3"),
      "A4" => Cell.new("A4"),
      "B1" => Cell.new("B1"),
      "B2" => Cell.new("B2"),
      "B3" => Cell.new("B3"),
      "B4" => Cell.new("B4"),
      "C1" => Cell.new("C1"),
      "C2" => Cell.new("C2"),
      "C3" => Cell.new("C3"),
      "C4" => Cell.new("C4"),   
      "D1" => Cell.new("D1"),
      "D2" => Cell.new("D2"),
      "D3" => Cell.new("D3"),
      "D4" => Cell.new("D4")
    }
  end

  def valid_coordinate?(coordinate)
    if @cells.include?(coordinate)
      true
    else 
      false
    end
  end

  # def valid_placement?(ship, coordinates)
  #   if ship.name == "Cruiser"
  #     if coordinates.length == 3
  #       true
  #     else
  #       false
  #     end
  #   elsif ship.name == "Submarine"
  #     if coordinates.length == 2
  #       true
  #     else
  #       false
  #     end
  #   end
  # end

  def valid_placement?(ship, coordinates)
    array_length(ship, coordinates) && consecutive_coordinates(ship, coordinates)
  end

  def array_length(ship, coordinates)
    if ship.name == "Cruiser"
      if coordinates.length == 3
        true
      else
        false
      end
    elsif ship.name == "Submarine"
      if coordinates.length == 2
        true
      else
        false
      end
    end
  end

  def consecutive_coordinates(ship, coordinates)
    if coordinates[0].chars.first == coordinates[1].chars.first && coordinates[1].chars.last.to_i == (coordinates[0].chars.last.to_i + 1)
      horizontal(ship, coordinates)
    elsif coordinates[0].chars.last == coordinates[1].chars.last && coordinates[1].chars.first == coordinates[0].chars.first.next
      vertical(ship, coordinates)
    else
      false
    end
  end

  def horizontal(ship, coordinates)
    if coordinates.length == 3
      row = []
      row << coordinates[0].chars.last.to_i
      row << coordinates[0].chars.last.to_i.next
      row << coordinates[0].chars.last.to_i.next.next
      if row.last == coordinates.last.chars.last.to_i
        true
      else 
        false
      end
    elsif coordinates.length == 2 
      row = []
      row << coordinates[0].chars.last.to_i
      row << coordinates[0].chars.last.to_i.next
      if row.last == coordinates.last.chars.last.to_i
        true
      else 
        false
      end
    end
  end

  def vertical(ship, coordinates)
    if coordinates.length == 2
      column = []
      column << coordinates[0].chars.first
      column << coordinates[0].chars.first.next
      if column.last == coordinates.last.chars.first
        true
      else 
        false
      end
    elsif coordinates.length == 3
      column = []
      column << coordinates[0].chars.first
      column << coordinates[0].chars.first.next
      column << coordinates[0].chars.first.next.next
      if column.last == coordinates.last.chars.first
        true
      else 
        false
      end
    end
  end


  # consecutive coordinates
  # we want to check if the coordinates given are consecutive 
  # calling the array index position 0 and checking if the remaining values are consecutive
  # how does the computer know what values are consecutive?
  # need to check if horozontally correct (all the same letter with consecutive numbers) and separately vertically correct (all the same number with consecutive letters)
  # horizontal: you can call 3.times(A.next) -ish
  # vertical: you can call 3.times(1.next) -ish
  # call map to get the numeric digits
  # "A1".chars.last.to_i
  # could use range based on the first number
  # convert a range to an array using .to_a
  # determine if the range.to_a == array given
  # the '..' is inclusive and '...' is exclusive 

  # use a sort method (probably need two methods)

  # cruiser: coordinates.each_cons(3)
  # submarine: coordinates.each_cons(2)
    

  

  

end

