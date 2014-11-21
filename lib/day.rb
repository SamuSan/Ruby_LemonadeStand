class Day
#price#
#climate / temperature#
#people
#sales
#turn_over  
  attr_accessor :price_per_cup, :turn_over, :profit
  attr_reader :climate, :foot_traffic

  def initialize(temperature_generator:, foot_traffic_generator:)
    @turn_over = 0
    @climate = temperature_generator.next
    @foot_traffic = foot_traffic_generator.calculate_foot_traffic(temperature: @climate)
  end
end