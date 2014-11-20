require 'rubystats'

class TemperatureGenerator
  MEAN_TEMPERATURE = 25
  TEMPERATURE_STD_DEV = 7

  def initialize
    @generator = Rubystats::NormalDistribution.new(MEAN_TEMPERATURE, TEMPERATURE_STD_DEV)
  end

  def next
    @generator.rng
  end
end