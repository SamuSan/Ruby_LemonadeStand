require 'inventory'

describe Inventory do
  let(:some_number) { double }
  let(:market) { Market.new }
  let(:inventory) { Inventory.new(market) } 

  describe "initialize" do
    it "creates and empty Inventory with no lemons " do
      expect(inventory.available_lemons).to be 0
    end

    it "creates and empty Inventory no cups of lemonade" do
      expect(inventory.cups_of_lemonade).to be 0
    end
  end

  describe "purchase_lemons" do
    it "purchases lemons and those show in the inventory of lemons" do
      inventory.purchase_lemons(10)
      expect(inventory.available_lemons).to eq 10
    end

    it "purchases lemons and reflects that in the available balance" do
      expect(market).to receive(:price_of_lemons).and_return(20)
      inventory.purchase_lemons(10)
      expect(inventory.send(:available_cash_balance)).to eq 800
    end
  end

  describe "purchase_sugar" do
    it "purchases lemons and those show in the inventory of lemons" do
      inventory.purchase_lemons(10)
      expect(inventory.available_lemons).to eq 10
    end

    it "purchases lemons and reflects that in the available balance" do
      expect(market).to receive(:price_of_lemons).and_return(20)
      inventory.purchase_lemons(10)
      expect(inventory.send(:available_cash_balance)).to eq 800
    end
  end
end