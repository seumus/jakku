require 'pry-byebug'
class Scavengers

  attr_accessor(:name, :found_items, :ration_bag)
  def initialize(name, found_items, ration_bag)
    @name = name
    @found_items = found_items
    @ration_bag = ration_bag
  end

  def how_many_items()
    return @found_items.length
  end

  # def get_item_name()
  #   return @found_items
  # end

  def get_item(planet)
    @found_items << planet.items.shuffle.pop
    check_for_mine
  end

  def sell_item(scrappy)
    @ration_bag << scrappy.store
  end

  def find_value()
    x = 0
    for item in @found_items
      x += item.value
    end
    return x
  end

  def give_items(scrappy)
    for item in @found_items
      # i = 0
      scrappy.traded_items << item
      # @found_items.delete(i)
      # i+=1
    end
    @found_items.clear
  end

  def transaction(scrappy, scavenger)
    scrappy.give_food(scavenger)
    give_items(scrappy)
  end

  def check_for_mine()
    for item in @found_items
      if item.item_name == "Mine"
        @ration_bag.clear
        @found_items.clear
        puts "YOU HAVE HIT A MINE!"
      end
    end
  end


end
