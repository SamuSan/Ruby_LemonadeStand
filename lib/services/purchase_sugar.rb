class PurchaseSugar
  def initialize(inventory:, number_to_buy:)
    @number_to_buy = number_to_buy
    @inventory = inventory 
  end

  def call
    @inventory.purchase_stock(item_to_buy: :sugar, number_to_buy: @number_to_buy)
  end
end