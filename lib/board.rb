class Board
  attr_reader :cells
            
  def initialize
    @cells = {}
  end

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
    array_length(ship, coordinates) && consecutive_coordinates(ship, coordinates) && not_overlapping?(ship, coordinates) 
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

  def not_overlapping?(ship, coordinates)
    coordinates.all? do |coordinate|
      @cells[coordinate].nil?
    end
  end
    
  def place(ship, coordinates)
    coordinates.each do |coordinate|
      @cells[coordinate].place_ship(ship)
    end
  end
  
  def render(show = false)
    output = "  1 2 3 4 \n"
    ("A".."D").each do |row|
      output += "#{row} "
      ("1".."4").each do |column|
        cell=@cells["#{row}#{column}"]
        output += (cell.ship.nil? ? "." : cell.render(show))
        output += " "
      end
        output += "\n"
    end
    output
    end     
 end
