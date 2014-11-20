class SellLemonade
  def initialize(inventory:)
    @day = day
    @inventory = inventory
  end

  def call
    @inventory.decrease_lemonade_stock_level
  end
end