

describe SellLemonade do
  let(:day)           { Day.new(temperature_generator: TemperatureGenerator.new, foot_traffic_generator: FootTrafficGenerator.new)}
  let(:market)        { Market.new }
  let(:inventory)     { Inventory.new(market) }
  # let(:purchase)
  let(:sell_lemonade) { SellLemonade.new(inventory: inventory, day: day) }
  describe "#call" do
    it "decreases then lemonade stock level in the inventory" do
      expect(inventory).to receive(:decrease_lemonade_stock_level).exactly(:once)
      sell_lemonade.call
    end
  end
end