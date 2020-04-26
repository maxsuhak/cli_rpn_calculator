RSpec.describe Commands::Instructions do
  subject { described_class }

  context 'COMMAND' do
    it { should be_const_defined(:COMMAND) }
    it { expect(described_class::COMMAND).to eq('i') }
  end

  context '.applicable?' do
    it 'returns true for i' do
      expect(subject.applicable?('i')).to eq true
    end

    it 'returns false for something is not i' do
      expect(subject.applicable?('t')).to eq false
    end
  end

  context '.execute' do
    let(:result) do
      "Press 'i' for instructions on use.\n" +
        "Press '?' for a link to more info about RPN.\n" +
        "Press 's' to see the current stack.\n" +
        "Press 'c' to clear the current stack.\n" +
        "Press 'w' to repeat this welcome message.\n" +
        "Press 'q' to quit."
    end

    it 'returns instructions' do
      expect(subject.execute).to eq result
    end
  end
end
