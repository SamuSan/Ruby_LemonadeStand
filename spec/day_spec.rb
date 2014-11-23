require 'day'
require 'temperature_generator'
require 'foot_traffic_generator'
require 'market'
require 'inventory'
require 'recipe'
require_relative '../lib/services/make_lemonade'
require_relative '../lib/services/sell_lemonade'
require_relative '../lib/services/purchase_lemons'
require_relative '../lib/services/purchase_sugar'

describe Day do
  let(:some_number)   { double }
  let(:market)        { Market.new }
  let(:inventory)     { Inventory.new(market) }
  let(:recipe)        { Recipe.new(lemons_per_cup:1, sugar_per_cup:1) } 
  let(:day)           { Day.new(temperature_generator: TemperatureGenerator.new, foot_traffic_generator: FootTrafficGenerator.new) }
  let(:make_lemonade) { MakeLemonade.new(inventory: inventory,recipe: recipe, number_of_cups: 1) } 
  let(:sell_lemonade) { SellLemonade.new(day: day, inventory: inventory) } 

  describe "#price_per_cup" do
    subject {day.price_per_cup}

    context "when the price has been set by the user" do
      before do
        day.price_per_cup = 5
      end

      it { is_expected.to be 5 }
    end
  end


  

  describe "#cash_float" do
    before do 
        expect(market).to receive(:price_of_sugar).at_least(:once).and_return(20)
        expect(market).to receive(:price_of_lemons).at_least(:once).and_return(20)
        PurchaseLemons.new(inventory: inventory, number_to_buy: 1).call
        PurchaseSugar.new(inventory:inventory, number_to_buy: 1).call
        make_lemonade.call
        day.price_per_cup = 5
    end
    
    subject {day.turn_over}

    context "when a cup of lemonade has been sold" do
      before do
        SellLemonade.new(inventory: inventory, day: day).call
      end

      it {is_expected.to be 5}
    end

    context "when a cup of lemonade has been sold with no available stock" do
      before do
        sell_two_cups = SellLemonade.new(inventory: inventory, day: day)
        2.times { sell_two_cups.call } 
      end

      it {is_expected.to be 5}
    end
  end 
end