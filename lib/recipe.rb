class Recipe
  attr_reader :lemons_per_cup, :sugar_per_cup
  
  def initialize(lemons_per_cup:, sugar_per_cup:)
    @lemons_per_cup = lemons_per_cup
    @sugar_per_cup  = sugar_per_cup
  end
end