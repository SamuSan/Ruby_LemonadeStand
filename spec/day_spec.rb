require 'day'

describe Day do
  let(:day) { Day.new }
  
  describe "initialize" do
    it "creates a new day with a random temperature below 40 degs" do
      expect(day.temperature).to be <= 40
    end 

    it "creates a new day with a random temperature greater than 25 degs" do
      expect(day.temperature).to be >= 15
    end     
  end

  describe "#decide_todays_weather" do
    let(:tomorrow) { Day.new }

    it "updates the days weather relative to yesterdays weather with a random amount of degress" do
      expect(day).to receive(:temperature).and_return 20
      tomorrow.decide_todays_weather(temperature_yesterday:day.temperature)
      expect(tomorrow).to receive(:temperature).and_return 19
      expect(tomorrow.temperature).to eq 19
    end
  end  
end