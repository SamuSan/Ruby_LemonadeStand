require_relative '../lib/inventory'
require_relative '../lib/market'
require_relative '../lib/services/purchase_lemons'
describe PurchaseLemons do
  let(:market)          { Market.new }
  let(:inventory)       { Inventory.new(market) }
  let(:purchase_lemons){ PurchaseLemons.new(inventory: inventory, number_to_buy: 10) }
  
  describe "call" do
    it "purchase the number of lemons specified" do
      expect(inventory.lemons_in_stock).to be 0
    end
  end

  describe "purchase_lemons" do
    it "purchases lemons and those show in the inventory of lemons" do
      purchase_lemons.call
      expect(inventory.lemons_in_stock).to eq 10
    end

    it "purchases lemons and reflects that in the available balance" do
      expect(market).to receive(:price_of_lemons).at_least(:once).and_return(20)
      purchase_lemons.call
      expect(inventory.send(:available_cash_balance)).to eq 800
    end
    
    it "does not allow a lemon purchase when the available balance is insufficient" do
      purchase_single_lemon = PurchaseLemons.new(inventory: inventory, number_to_buy: 10)

      expect(market).to receive(:price_of_lemons).at_least(:once).and_return(1200)
      expect(purchase_lemons.call).to be false
    end
  end
end