class SellLemonade
  def initialize(inventory:, day:)
    @inventory = inventory
    @day = day
  end

  def call
    @day.turn_over += @day.price_per_cup if @inventory.decrease_lemonade_stock_level
  end
end