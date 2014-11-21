class ReconcileDailySales
  def initialize(inventory:, day:)
    @inventory = inventory
    @day = day
  end

  def call
    @day.profit = calculate_profit
    @inventory.cash_float = Inventory::INITIAL_CASH_BALANCE
  end

  def calculate_profit
    @day.turn_over - (Inventory::INITIAL_CASH_BALANCE - @inventory.cash_float)
  end
end