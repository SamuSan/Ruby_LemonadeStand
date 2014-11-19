require 'inventory'

describe Inventory do
  let(:some_number)   { double }
  let(:market)        { Market.new }
  let(:inventory)     { Inventory.new(market) }
  let(:recipe)        { Recipe.new(lemons_per_cup:1, sugar_per_cup:1) } 
  let(:make_lemonade) { MakeLemonade.new(inventory: inventory,recipe: recipe, number_of_cups: 1) } 

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
      expect(market).to receive(:price_of_lemons).at_least(:once).and_return(20)
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



  describe "#price_per_cup" do
    subject {inventory.price_per_cup}

    context "when the price has been set by the user" do
      before do
        inventory.decide_price_per_cup(5)
      end

      it {is_expected.to be 5}
    end
  end

  describe "#available_cash_balance" do
    before do 
        expect(market).to receive(:price_of_sugar).at_least(:once).and_return(20)
        expect(market).to receive(:price_of_lemons).at_least(:once).and_return(20)
        inventory.purchase_sugar(1)
        inventory.purchase_lemons(1)
        make_lemonade.call
        inventory.decide_price_per_cup(5)
    end
    subject {inventory.available_cash_balance}

    context "when a cup of lemonade has been sold" do
      before do
        inventory.sell_cup_of_lemonade
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