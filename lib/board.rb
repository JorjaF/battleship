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

  def valid_placement?(ship, coordinates)
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
    

    # if the ship type is a "cruiser", then the coordinate array length should equal 3
  # else if the ship type is a "submarine", then the coordinate array length should equal 2

  

end

