class Planet

attr_accessor(:planet_name, :items)

def initialize(planet_name, items)
  @planet_name = planet_name
  @items = items
end

def find_how_many_items()
  return @items.length
end

def show_items()
  return @items
end

def runner(scavenger, planet)
  scavenger.get_item(planet)
  if scavenger.found_items.length == 1
    print scavenger.found_items[0].item_name
  end
end

end
