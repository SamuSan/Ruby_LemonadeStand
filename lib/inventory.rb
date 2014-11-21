class Inventory
  INITIAL_CASH_BALANCE = 1000
  
  attr_reader :lemons_in_stock, :sugar_in_stock, :cups_of_lemonade, :price_per_cup
  attr_accessor :cash_float
  def initialize(market)
    @market = market
    @cash_float = INITIAL_CASH_BALANCE
    @lemons_in_stock  = 0
    @sugar_in_stock   = 0 
    @cups_of_lemonade = 0
  end

  def purchase_stock(item_to_buy:, number_to_buy:)
    item_to_buy == :lemons ? purchase_lemons(number_to_buy) : purchase_sugar(number_to_buy)
  end

  def can_provide_ingredients?(lemons, sugar)
    sufficient_lemons?(lemons)  && sufficient_sugar?(sugar)
  end

  def increase_lemonade_stock_level(number_of_cups:)
    @cups_of_lemonade += number_of_cups
  end

  def decrease_lemonade_stock_level
    if have_cup_to_sell?
      @cups_of_lemonade -= 1
    end 
  end

  def decrease_stock_levels(lemons:, sugar:)
    decrease_sugar_stock_level(sugar)
    decrease_lemons_stock_level(lemons)
  end

  private

  def purchase_lemons(number_of_lemons)
    if can_make_purchase?(number_of_lemons, @market.price_of_lemons)
      @cash_float -= number_of_lemons * @market.price_of_lemons
      @lemons_in_stock += number_of_lemons
    else
      false
    end
  end

  def purchase_sugar(amount_of_sugar)
    if can_make_purchase?(amount_of_sugar, @market.price_of_sugar)
      @cash_float -= amount_of_sugar * @market.price_of_sugar
      @sugar_in_stock += amount_of_sugar
    else
      false
    end
  end

  def sufficient_lemons?(lemon_to_be_used)
    lemons_in_stock - lemon_to_be_used >= 0
  end

  def sufficient_sugar?(sugar_to_be_used)
    sugar_in_stock - sugar_to_be_used >= 0
  end

  def decrease_lemons_stock_level(used_lemons)
    @lemons_in_stock -= used_lemons
  end

  def decrease_sugar_stock_level(used_sugar)
    @sugar_in_stock -= used_sugar
  end

  def have_cup_to_sell?
    @cups_of_lemonade > 0    
  end

  def can_make_purchase?(number_of_items, price)
    @cash_float - (number_of_items * price) >= 0
  end
end