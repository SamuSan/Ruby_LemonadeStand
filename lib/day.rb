class Day
  MAX_TEMP = 40
  MIN_TEMP = 15
  TEMP_CHANGE_RANGE = (-3..3)

  attr_reader :temperature

  def initialize
    @temperature = rand(MIN_TEMP..MAX_TEMP)
  end
  
  def decide_todays_weather(temperature_yesterday:)
    new_temperature_value = @temperature + rand(TEMP_CHANGE_RANGE)
    
    if new_temperature_is_in_range? new_temperature_value
      @temperature = new_temperature_value
    elsif new_temperature_value > 40
      @temperature = 40
      false
    elsif new_temperature_value < 15
      @temperature = 15
      false
    end
  end

  private

  def new_temperature_is_in_range?(new_temperature_value)
    new_temperature_value < MAX_TEMP && new_temperature_value > MIN_TEMP
  end
end