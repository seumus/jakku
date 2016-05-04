require( 'minitest/autorun')
require_relative('../planet.rb')
require_relative('../items.rb')
require_relative('../scavengers.rb')
require_relative('../scrappy.rb')

class Testscavengers < Minitest::Test

def setup
  @scavenger1 = Scavengers.new("Allan", [])
  @scavenger2 = Scavengers.new("Seumus", [])
end

def test_scavenger_name
  assert_equal("Allan", @scavenger1.name)
end
end
