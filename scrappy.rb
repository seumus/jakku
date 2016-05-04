class Scrappy

attr_accessor(:scrappy_name, :food, :traded_items)
def initialize(scrappy_name, food, traded_items)
  @scrappy_name = scrappy_name
  @food = food
  @traded_items = traded_items
end


def give_food(scavenger)
  scavenger.ration_bag << @food.take(scavenger.find_value)
  return scavenger.ration_bag.flatten!
end


end
