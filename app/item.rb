# require 'pry'

class Item
  attr_accessor :name, :price

  @@all = []

  def initialize(name,price)
    @name = name
    @price = price
      @@all << self
  end

  def self.all
    @@all
  end


end
#
# greeting = Item.new("hi", 3.56)
# puts greeting.name
# Item.new("duck", 5.56)
# binding.pry
# puts Item.all
