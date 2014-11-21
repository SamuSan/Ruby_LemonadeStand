require 'market'
describe Market do
  let(:market) { Market.new }
  
  describe "initialize" do
    it "creates a market with a price for lemons less than 50 cents" do
     expect(market.price_of_lemons).to be <= Market::MAX_LEMON_PRICE
    end
    
    it "creates a market with a price for lemons more than 25 cents" do
      expect(market.price_of_lemons).to be >= Market::MIN_SUGAR_PRICE
    end

    it "creates a market with a price for sugar that is more than 2 cents" do
      expect(market.price_of_sugar).to be >= Market::MIN_SUGAR_PRICE
    end

    it "creates a market with a price for lemons that is less than 5 cents" do
      expect(market.price_of_sugar).to be <= Market::MAX_SUGAR_PRICE
    end
  end

  describe "update_price_of_lemons" do
    it "updates the price of lemons in the market with a valid price" do
      market.update_price_of_lemons
      expect(market.price_of_lemons).to be <= Market::MAX_LEMON_PRICE
    end

    it "updates the price of lemons in the market with a valid price" do
      market.update_price_of_lemons
      expect(market.price_of_lemons).to be >= Market::MIN_LEMON_PRICE
    end
  end

  describe "update_price_of_sugar" do
    it "updates the price of sugar in the market with a valid price" do
      market.update_price_of_sugar
      expect(market.price_of_sugar).to be <= Market::MAX_SUGAR_PRICE
    end

    it "updates the price of sugar in the market with a valid price" do
      market.update_price_of_sugar
      expect(market.price_of_sugar).to be >= Market::MIN_SUGAR_PRICE
    end
  end
end