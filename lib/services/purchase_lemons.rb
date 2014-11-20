class PurchaseLemons
  def initialize(inventory:, number_to_buy:)
    @number_to_buy = number_to_buy
    @inventory = inventory 
  end

  def call
    @inventory.purchase_stock(item_to_buy: :lemons, number_to_buy: @number_to_buy)
  end
end