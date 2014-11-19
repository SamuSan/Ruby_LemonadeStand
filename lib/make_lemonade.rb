require_relative 'recipe'

class MakeLemonade
  def initialize(inventory:, recipe: nil, number_of_cups:)
    recipe ||= Recipe.new(lemons_per_cup: 1, sugar_per_cup: 1)

    @inventory = inventory
    @lemons = recipe.lemons_per_cup * number_of_cups
    @sugar = recipe.sugar_per_cup * number_of_cups
    @number_of_cups = number_of_cups
  end

  def call
    if @inventory.can_provide_ingredients?(@lemons, @sugar)
      @inventory.decrease_stock_levels(lemons: @lemons, sugar: @sugar)
      @inventory.increase_lemonade_stock_level(number_of_cups: @number_of_cups)
    else
      false
    end
  end
end