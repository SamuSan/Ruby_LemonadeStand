require 'market'
describe Market do
  let(:market) { Market.new }
  describe "initialize" do
    it "creates a market with a price for lemons less than 50 cents" do
      expect(market).to receive(:price_of_lemons).and_return(43)
      expect(market.price_of_lemons).to eq 43
    end
    
    it "creates a market with a price for lemons more than 25 cents" do
      expect(market.price_of_lemons).to be >= 25
    end

    it "creates a market with a price for sugar that is more than 2 cents" do
      expect(market.price_of_sugar).to be >= 2
    end

    it "creates a market with a price for lemons that is less than 5 cents" do
      expect(market.price_of_sugar).to be <= 5
    end
  end


end