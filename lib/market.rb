class Market
  MAX_LEMON_PRICE = 50
  MIN_LEMON_PRICE = 25
  MAX_SUGAR_PRICE = 5
  MIN_SUGAR_PRICE = 2

  attr_reader :price_of_lemons, :price_of_sugar

  def initialize
    @price_of_lemons  = rand(MIN_LEMON_PRICE..MAX_LEMON_PRICE)
    @price_of_sugar   = rand(MIN_SUGAR_PRICE..MAX_SUGAR_PRICE)
  end

  def update_price_of_lemons
    @price_of_lemons  = rand(MIN_LEMON_PRICE..MAX_LEMON_PRICE)
  end

  def update_price_of_sugar
    @price_of_sugar   = rand(MIN_SUGAR_PRICE..MAX_SUGAR_PRICE)
  end
end 