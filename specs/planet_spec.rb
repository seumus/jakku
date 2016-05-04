require( 'minitest/autorun')
require_relative('../planet.rb')
require_relative('../items.rb')
require_relative('../scavengers.rb')
require_relative('../scrappy.rb')

class Testplanet < Minitest::Test

  def setup
    @item1 = Item.new("Gold Nugget", 2)
    @item2 = Item.new("Thruster", 4)
    @item3 = Item.new("Lead Pipe", 1)
    @item4 = Item.new("Cloth", 3)
    @item5 = Item.new("Mine", 0)
    @item6 = Item.new("Gun", 4)
    @item7 = Item.new("Football", 8)
    items = [@item1, @item2, @item3, @item4, @item5, @item6, @item7]
    @jakku = Planet.new("Jakku", items)
    @scavenger1 = Scavengers.new("Allan", [], [])
    @scavenger2 = Scavengers.new("Seumus", [], [])
    @scrappy = Scrappy.new("Scrappy", [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0], [])

  end

  def test_planet_name
    assert_equal("Jakku", @jakku.planet_name)
  end

  def test_items_on_planet
    assert_equal(7, @jakku.find_how_many_items)
  end

  # def test_find_item
  #   assert_equal(1, @scavenger1.find_item(@jakku.items))
  # end

  def test_get_item
    @scavenger1.get_item(@jakku)
    assert_equal(1, @scavenger1.found_items.length)
  end

  def test_give_food
    scavenger1 = Scavengers.new("Allan", [@item1], [])
    @scrappy.give_food(scavenger1)
    assert_equal([0,0], scavenger1.ration_bag)
  end

  def test_find_value()
    scavenger2 = Scavengers.new("Seumus", [@item1, @item2], [])
    assert_equal(6, scavenger2.find_value)
  end

  def test_give_items
    scavenger1 = Scavengers.new("Allan", [@item1, @item2], [])
    scavenger1.give_items(@scrappy)
    assert_equal([], scavenger1.found_items)
    assert_equal([@item1, @item2], @scrappy.traded_items)
  end

  def test_transaction
    scavenger1 = Scavengers.new("Allan", [@item1, @item2], [])
    # scavenger1.transaction(@scrappy)
    scavenger1.transaction(@scrappy, scavenger1)
    assert_equal([], scavenger1.found_items)
    assert_equal([0,0,0,0,0,0], scavenger1.ration_bag)
  end

  def test_mine
    scavenger1 = Scavengers.new("Allan", [@item2, @item5], [0,0,0])
    scavenger1.check_for_mine()
    assert_equal([], scavenger1.ration_bag)
    assert_equal([], scavenger1.found_items)
  end


end
