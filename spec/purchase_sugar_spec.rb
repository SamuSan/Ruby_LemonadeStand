require_relative '../lib/inventory'
require_relative '../lib/market'
require_relative '../lib/services/purchase_sugar'

describe PurchaseSugar do
  let(:market)          { Market.new }
  let(:inventory)       { Inventory.new(market) }
  let(:purchase_sugar)  { PurchaseSugar.new(inventory: inventory, number_to_buy: 10) }
  
  describe "call" do
    it "purchase the number of sugar specified" do
      expect(inventory.sugar_in_stock).to be 0
    end
  end

  describe "purchase_sugar" do
    it "purchases sugar and those show in the inventory of sugar" do
      purchase_sugar.call
      expect(inventory.sugar_in_stock).to eq 10
    end

    it "purchases sugar and reflects that in the available balance" do
      expect(market).to receive(:price_of_sugar).at_least(:once).and_return(20)
      purchase_sugar.call
      expect(inventory.send(:cash_float)).to eq 800
    end
    
    it "does not allow a sugar purchase when the available balance is insufficient" do
      purchase_single_sugar = PurchaseSugar.new(inventory: inventory, number_to_buy: 10)

      expect(market).to receive(:price_of_sugar).at_least(:once).and_return(1200)
      expect(purchase_sugar.call).to be false
    end
  end
end