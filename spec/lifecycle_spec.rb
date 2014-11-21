require 'lifecycle'

describe Lifecycle do
  let(:lifecycle) { Lifecycle.new }
  let(:day)       { instance_double("Day") }

  describe "initialize" do
    it "creates a new lifecycle with no days" do
      expect(lifecycle.days).to be_empty
    end  
  end

  describe "#add_day_to_lifecycle" do
    it "adds a day to the lifecycle" do
      lifecycle.add_day_to_lifecycle(day: day)
      expect(lifecycle.days.size).to be 1
    end
  end

  describe "#calculate_game_result" do
    before do 
      expect(day).to receive(:profit).exactly(30).times.and_return(100)
      30.times { lifecycle.add_day_to_lifecycle(day: day) }
    end

    it "calculate the total profit for a whole game" do
      expect(lifecycle.calculate_game_result).to be 3000
    end
  end
end