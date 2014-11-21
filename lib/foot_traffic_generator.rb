class FootTrafficGenerator
  POPULATION_STD_DEV = 2

  def calculate_foot_traffic(temperature:)
     @generator = Rubystats::NormalDistribution.new(temperature, POPULATION_STD_DEV)   
     @generator.rng
  end
end