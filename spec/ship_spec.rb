require 'rspec'
require './lib/ship'


RSpec.describe Ship do
  it 'exists' do
    expect(cruiser = Ship.new("Cruiser", 3)).to be_a(Ship)
  end

end



# cruiser = Ship.new("Cruiser", 3)
# #=> #<Ship:0x00007feb05112d10...>

# cruiser.name
# #=> "Cruiser"

# cruiser.length
# #=> 3

# cruiser.health
# #=> 3

# cruiser.sunk?
# #=> false

# cruiser.hit

# cruiser.health
# #=> 2

# cruiser.hit

# cruiser.health
# #=> 1

# cruiser.sunk?
# #=> false

# cruiser.hit

# cruiser.sunk?
# #=> true