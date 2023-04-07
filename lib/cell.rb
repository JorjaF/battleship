class Cell
  attr_reader :coordinate 
            
  def initialize(coordinate)
    @coordinate = coordinate
  end

  def ship
    @nil
  end

  def empty?
    if @ship == nil
      true
    else
      false
    end
  end

  def place_ship(ship_name)
    @ship = ship_name
  end
end