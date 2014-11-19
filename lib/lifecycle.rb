class Lifecycle
  attr_reader :day

  def initialize(day:)
    @day = day
  end

  def cycle_one_day
    @day.decide_todays_weather(temperature_yesterday: @day.temperature)
  end
end