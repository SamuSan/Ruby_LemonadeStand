require 'inventory'
require 'market'
require_relative '../lib/services/sell_lemonade'

describe Inventory do
  let(:some_number)   { double }
  let(:market)        { Market.new }
  let(:inventory)     { Inventory.new(market) }
  let(:recipe)        { Recipe.new(lemons_per_cup:1, sugar_per_cup:1) } 
  let(:day)           { Day.new(temperature_generator: TemperatureGenerator.new, foot_traffic_generator: FootTrafficGenerator.new) }
  let(:make_lemonade) { MakeLemonade.new(inventory: inventory,recipe: recipe, number_of_cups: 1) } 
  let(:sell_lemonade) { SellLemonade.new(day: day, inventory: inventory) } 

  describe "initialize" do
    it "creates and empty Inventory with no lemons " do
      expect(inventory.lemons_in_stock).to be 0
    end

    it "creates and empty Inventory with no sugar " do
      expect(inventory.sugar_in_stock).to be 0
    end

    it "creates and empty Inventory no cups of lemonade" do
      expect(inventory.cups_of_lemonade).to be 0
    end
  end


end