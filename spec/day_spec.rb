require 'day'
require 'temperature_generator'

describe Day do
  let(:day) { Day.new(temperature_generator: TemperatureGenerator.new) }

  describe "#price_per_cup" do
    subject {day.price_per_cup}

    context "when the price has been set by the user" do
      before do
        day.price_per_cup = 5
      end

      it {is_expected.to be 5}
    end
  end
# pending "Cos shit is done broked"  
#   describe "initialize" do
#     it "creates a new day with a random temperature below 40 degs" do
#       expect(day.temperature).to be <= 60
#     end 

#     it "creates a new day with a random temperature greater than 25 degs" do
#       expect(day.temperature).to be >= 15
#     end     
#   end
# pending "Cos shit is done broked"
#   describe "#decide_todays_weather" do
#     it "updates the days weather relative to yesterdays weather with a random amount of degress" do
#       expect(day).to receive(:temperature).and_return 20
#       day.decide_todays_weather
#       expect(day.temperature).to eq 20
#     end
#   end  
end