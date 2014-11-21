describe FootTrafficGenerator do
  let(:foot_traffic_generator) { FootTrafficGenerator.new }
  let(:normal_distribution)  { instance_double("Rubystats::NormalDistribution") }
  let(:response)             { double }

  describe "#calculate_foot_traffic" do
    it "creates a population based on the temperature today" do
      expect(Rubystats::NormalDistribution).to receive(:new).with(10, 2).and_return(normal_distribution)
      expect(normal_distribution).to receive(:rng).and_return response
      expect(foot_traffic_generator.calculate_foot_traffic(temperature: 10)).to eq response
    end
  end
end