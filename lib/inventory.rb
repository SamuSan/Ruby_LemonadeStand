class Inventory
  attr_reader :number_of_lemons, :cups_of_lemonade
  def initialize(market)
    @market = market
    @available_cash_balance = 1000
    @number_of_lemons = 0
    @cups_of_lemonade = 0 
    @current_balance = 0
  end

  def available_lemons
    @number_of_lemons - @cups_of_lemonade
  end

  def purchase_lemons(number_of_lemons)
    @number_of_lemons += number_of_lemons
    pay_for_stock(number_of_lemons, @market.price_of_lemons) 
  end

  private

  def pay_for_stock(number_of_items, price)
    @available_cash_balance -= number_of_items * price
  end

  def make_lemonade(number_of_cups)
    @cups_of_lemonade += number_of_cups    
  end

  def available_cash_balance
    @available_cash_balance
  end
end