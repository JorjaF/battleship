class Ship
  attr_reader :name, 
              :length
            
  def initialize(name, length)
    @name = name
    @length = length
    @hit_count = 0
  end

  def health
    @length - @hit_count
  end

  def hit 
    @hit_count += 1
    @health
  end

  def sunk?
    if health > 0
      false
    else 
      true
    end
  end
end