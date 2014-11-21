require_relative '../lib/services/reconcile_sales'
require_relative '../lib/temperature_generator'
require_relative '../lib/foot_traffic_generator'
require_relative '../lib/market'
require_relative '../lib/inventory'
require_relative '../lib/day'

describe ReconcileDailySales do

  let(:day)       { Day.new(temperature_generator: TemperatureGenerator.new, foot_traffic_generator: FootTrafficGenerator.new)}
  let(:market)    { Market.new }
  let(:inventory) { Inventory.new(market) }
  let(:reconcile_sales) { ReconcileDailySales.new(inventory: inventory, day: day) }

  before do 
    expect(day).to receive(:turn_over).at_least(:once).and_return(100)
  end

  describe "#call" do
    it "resets the float in the inventory" do
      expect(inventory).to receive(:cash_float=).with(Inventory::INITIAL_CASH_BALANCE)
      reconcile_sales.call
    end

    it "records the profit in for today in today" do
      reconcile_sales.call
      profit = (day.turn_over - (Inventory::INITIAL_CASH_BALANCE - inventory.cash_float))
      expect(day.profit).to eq profit
    end
  end
end