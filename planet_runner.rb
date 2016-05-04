require_relative('planet.rb')
require_relative('items.rb')
require_relative('scavengers.rb')
require_relative('scrappy.rb')

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
# players = [@scavenger1,@scavenger2]
@scrappy = Scrappy.new("Scrappy", [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0], [])



@scavenger1.get_item(@jakku)
if @scavenger1.found_items.length == 1
print @scavenger1.found_items[0].item_name
puts " - You now have an item of value #{@scavenger1.find_value}"
@scavenger1.transaction( @scrappy, @scavenger1)
puts " - You sold your item to the scrappy and now have this food #{@scavenger1.ration_bag}"
end
