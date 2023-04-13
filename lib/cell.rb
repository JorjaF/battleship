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
    @ship == nil
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon 
    if @fired_upon == false
      @ship.hit if @ship
      @fired_upon = true
    end
  end

  def render(show = false) 
    if @fired_upon == false
      show == false ? "." : "S" 
    else 
      if @ship.nil?
        "M" 
      elsif @ship.sunk?
        "X"
      else
        "H"
      end
    end
  end
end
