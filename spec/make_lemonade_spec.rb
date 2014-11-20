require_relative '../lib/services/make_lemonade'
require_relative '../lib/recipe'
describe MakeLemonade do
  let(:market)      { Market.new }
  let(:inventory)   { Inventory.new(market) }
  let(:recipe)      { Recipe.new(lemons_per_cup:1, sugar_per_cup:1) } 
  let(:make_lemonade) { MakeLemonade.new(inventory: inventory, recipe: recipe, number_of_cups: 10) } 

  describe "initialize" do
    pending "cos this is kinda shitty"
    it "creates a new lemonade maker with the given recipe" do

    end
  end

  describe "call" do
    before do
      PurchaseLemons.new(inventory: inventory, number_to_buy: 10).call
      PurchaseSugar.new(inventory:inventory, number_to_buy: 10).call
    end

    it "makes n cups of lemonade" do
      make_lemonade.call
      expect(inventory.cups_of_lemonade).to eq 10
    end

    it "removes exactly one lemon for each cup made" do
      make_lemonade.call
      expect(inventory.lemons_in_stock).to eq 0
    end

    it "removes exactly one sugar for each cup made" do
      make_lemonade.call
      expect(inventory.sugar_in_stock).to eq 0
    end

    it "makes no cups if there is no stock available" do
      make_lemonade.call
      make_lemonade.call #second call expected to do nothing as stock exhausted
      expect(inventory.cups_of_lemonade).to eq 10
    end
  end
end