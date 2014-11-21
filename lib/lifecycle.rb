class Lifecycle
  attr_accessor :days

  def initialize
    @days = []
  end

  def add_day_to_lifecycle(day:)
    @days.push(day)
  end

  def calculate_game_result
    @days.map { |day| day.profit }.reduce { |sum, profit| sum + profit }
  end
end
