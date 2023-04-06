class Ship
  attr_reader :name 
              :length
              :health
            

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
    
    # we want the hit method to decrement the health number by 1 every time it is called 
    # 
  end

  def sunk?
    if health > 0
      false
    else 
      true
    end
  end


end