require 'inventory'

describe Inventory do
  let(:some_number) { double }
  let(:market)      { Market.new }
  let(:inventory)   { Inventory.new(market) } 

  describe "initialize" do
    it "creates and empty Inventory with no lemons " do
      expect(inventory.lemons_in_stock).to be 0
    end

    it "creates and empty Inventory no cups of lemonade" do
      expect(inventory.cups_of_lemonade).to be 0
    end
  end

  describe "purchase_lemons" do
    it "purchases lemons and those show in the inventory of lemons" do
      inventory.purchase_lemons(10)
      expect(inventory.lemons_in_stock).to eq 10
    end

    it "purchases lemons and reflects that in the available balance" do
      expect(market).to receive(:price_of_lemons).and_return(20)
      inventory.purchase_lemons(10)
      expect(inventory.send(:available_cash_balance)).to eq 800
    end

    it "does not allow a lemon purchase when the available balance is insufficient" do
      expect(market).to receive(:price_of_lemons).at_least(:once).and_return(1000)
      inventory.purchase_lemons(1)
      expect(inventory.purchase_lemons(1)).to be false
    end
  end

  describe "purchase_sugar " do
    it "purchases sugar and those show in the inventory of sugar" do
      inventory.purchase_sugar(10)
      expect(inventory.sugar_in_stock).to eq 10
    end

    it "purchases sugar and reflects that in the available balance" do
      expect(market).to receive(:price_of_sugar).at_least(:once).and_return(20)
      inventory.purchase_sugar(10)
      expect(inventory.send(:available_cash_balance)).to eq 800
    end

    it "does not allow a sugar purchase when the available balance is insufficient" do
      expect(market).to receive(:price_of_sugar).at_least(:once).and_return(1000)
      inventory.purchase_sugar(1)
      expect(inventory.purchase_sugar(1)).to be false
    end
  end

  describe "make_lemonade" do
    before do
      inventory.purchase_lemons(10)
      inventory.purchase_sugar(10) 
    end

    it "makes n cups of lemonade" do
      inventory.make_lemonade(5)
      expect(inventory.cups_of_lemonade).to eq 5
    end

    it "removes exactly one lemon for each cup made" do
      inventory.make_lemonade(10)
      expect(inventory.lemons_in_stock).to eq 0
    end

    it "removes exactly one sugar for each cup made" do
      inventory.make_lemonade(10)
      expect(inventory.sugar_in_stock).to eq 0
    end

    it "makes no cups if there is no stock available" do
      inventory.make_lemonade(10)
      inventory.make_lemonade(10)
      expect(inventory.cups_of_lemonade).to eq 10
    end
  end

  describe "price_per_cup" do
    it "sets the price per cup of lemonade" do
      inventory.decide_price_per_cup(5)
      expect(inventory.price_per_cup).to eq 5
    end
    context "stock has been purchased, lemonade made and price set" do
      it "increments the available_cash_balance by the price when a cup is sold" do
        inventory.decide_price_per_cup(5)
        expect(inventory.price_per_cup).to eq 5

        expect(inventory.send(:available_cash_balance)).to eq 800
      end
  end
  end
end