require 'lifecycle'

describe Lifecycle do
  let(:day)       { Day.new(temperature_generator: TemperatureGenerator.new) }
  let(:lifecycle) { Lifecycle.new(first_day: day) }

  describe "cycle_one_day" do
    it "changes the days weather relative to yesterdays weather" do
      expect(day).to receive(:decide_todays_weather).and_return(18)
      lifecycle.cycle_one_day
    end
  end
end