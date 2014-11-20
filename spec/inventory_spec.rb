require 'inventory'
require 'market'

describe Inventory do
  let(:some_number)   { double }
  let(:market)        { Market.new }
  let(:inventory)     { Inventory.new(market) }
  let(:recipe)        { Recipe.new(lemons_per_cup:1, sugar_per_cup:1) } 
  let(:day)           { Day.new(temperature_generator: TemperatureGenerator.new) }
  let(:make_lemonade) { MakeLemonade.new(inventory: inventory,recipe: recipe, number_of_cups: 1) } 
  let(:sell_lemonade) { SellLemonade.new(day: day, inventory: inventory) } 

  describe "initialize" do
    it "creates and empty Inventory with no lemons " do
      expect(inventory.lemons_in_stock).to be 0
    end

    it "creates and empty Inventory no cups of lemonade" do
      expect(inventory.cups_of_lemonade).to be 0
    end
  end

  describe "#available_cash_balance" do
    before do 
        expect(market).to receive(:price_of_sugar).at_least(:once).and_return(20)
        expect(market).to receive(:price_of_lemons).at_least(:once).and_return(20)
        PurchaseLemons.new(inventory: inventory, number_to_buy: 1).call
        PurchaseSugar.new(inventory:inventory, number_to_buy: 1).call
        make_lemonade.call
        day.price_per_cup = 5
    end
    
    subject {inventory.available_cash_balance}

    context "when a cup of lemonade has been sold" do
      before do
        SellLemonade.new(inventory: inventory)
      end

      it {is_expected.to be 965}
    end

    context "when a cup of lemonade has been sold with no available stock" do
      before do
        2.times { inventory.sell_cup_of_lemonade } 
      end

      it {is_expected.to be 965}
    end
  end
end