class Cell
  attr_reader :coordinate,
              :ship,
              :fire_upon
            
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
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

  def fired_upon?
    @fired_upon
  end

  def fire_upon 
    if @fired_upon == true
      nil
    else 
      @ship.hit
      @fired_upon = true
    end
  end
end