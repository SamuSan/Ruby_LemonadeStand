require 'lifecycle'

describe Lifecycle do
  let(:day)       { Day.new }
  let(:lifecycle) { Lifecycle.new(day: day) }

  describe "initialize" do
    it "Creates a new life cycle with a single day" do
      expect(lifecycle.day).to be_truthy
    end
  end

  describe "cycle_one_day" do
    it "changes the days weather relative to yesterdays weather" do
      expect(day).to receive(:temperature).and_return(18)
      lifecycle.cycle_one_day
    end
  end
end