require( 'minitest/autorun')
# require_relative('../planet.rb')
# require_relative('../items.rb')
# require_relative('../scavengers.rb')
require_relative('../scrappy.rb')

class Testscrappy < Minitest::Test

  def setup
    @scrappy = Scrappy.new("Scrappy")
  end

  def test_scrappy_name
    assert_equal("Scrappy", @scrappy.scrappy_name)
  end

  
end
