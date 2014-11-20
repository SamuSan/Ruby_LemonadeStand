class Lifecycle
  def initialize(first_day:)
    @day = first_day
  end

  def current_temperature
    @day.temperature  
  end

  def cycle_one_day
    @day.decide_todays_weather
  end
end
