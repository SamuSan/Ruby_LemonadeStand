class Day
#price
#climate / temperature
#people
#sales
#profit
  attr_accessor :price_per_cup
  attr_reader :climate

  def initialize(temperature_generator:)
    @climate = temperature_generator.next
  end

  def method_name
    
  end
end