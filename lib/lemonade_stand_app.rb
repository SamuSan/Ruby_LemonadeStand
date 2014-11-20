require_relative 'lifecycle'
require_relative 'day'
require_relative 'user_interface'
require_relative 'market'
require_relative 'inventory'
require_relative 'services/purchase_lemons'
require_relative 'services/purchase_sugar'

class LemonadeStandApp
attr_reader :lifecycle
# Init the day
  def initialize
    @today = Day.new(TemperatureGenerator.new) 
    @lifecycle = Lifecycle.new(first_day: @today)
    @user_interface = UserInterface.new(lemonade_stand_app: self)
    @market = Market.new
    @inventory = Inventory.new(@market)
  end

  def run
    30.times { play_one_round }
  end

  def play_one_round
          #Give the wether report
      @user_interface.give_weather_report
      #Tell the user the daily stock prices at the market

      #ASk the user for their stock order
      #Purchase stock
      PurchaseLemons.new(@inventory, @user_interface.ask_for_lemons_order)
      PurchaseSugar.new(@inventory, @user_interface.ask_for_sugar_order)

      #ask the user to decide the price for cup of lemonade
      #set the cup price
      @inventory.decide_price_per_cup(@user_interface.ask_user_for_lemonade_price)
      #Advance one day
      @lifecycle.cycle_one_day
      #Show the profit / loss
  end
end


















#repeat



