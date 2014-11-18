class Inventory
  attr_reader :lemons_in_stock, :sugar_in_stock, :cups_of_lemonade, :price_per_cup

  def initialize(market)
    @market = market
    @available_cash_balance = 1000
    @lemons_in_stock  = 0
    @sugar_in_stock   = 0 
    @cups_of_lemonade = 0
    @price_per_cup    = 0 
  end

  def purchase_lemons(number_of_lemons)
    if pay_for_stock(number_of_lemons, @market.price_of_lemons)
      @lemons_in_stock += number_of_lemons
    else
      false
    end
  end

  def purchase_sugar(amount_of_sugar)
    if can_make_purchase?(amount_of_sugar, @market.price_of_sugar)
      @available_cash_balance -= amount_of_sugar * @market.price_of_sugar
      @sugar_in_stock += amount_of_sugar
    else
      false
    end
  end

  def make_lemonade(number_of_cups)
    if sufficient_stock?(number_of_cups) 
      @cups_of_lemonade += number_of_cups
      @lemons_in_stock -= number_of_cups
      @sugar_in_stock -= number_of_cups
    end
  end

  def decide_price_per_cup(price)
    @price_per_cup = price
  end

  def sell_cup_of_lemonade
    @available_cash_balance += @price_per_cup  
  end

  private

  def pay_for_stock(number_of_items, price)
    if can_make_purchase?(number_of_items, price) 
      @available_cash_balance -= number_of_items * price
      true
    end
  end

  def sufficient_stock?(number_of_cups)
    lemons_in_stock - number_of_cups >= 0
  end

  def has_cup_to_sell?
    @cups_of_lemonade > 0    
  end

  def can_make_purchase?(number_of_items, price)
    @available_cash_balance - (number_of_items * price) >= 0
  end

  def available_cash_balance
    @available_cash_balance
  end
end