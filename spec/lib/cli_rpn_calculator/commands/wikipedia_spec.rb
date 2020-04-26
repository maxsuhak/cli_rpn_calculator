RSpec.describe Commands::Wikipedia do
  subject { described_class }

  context 'COMMAND' do
    it { should be_const_defined(:COMMAND) }
    it { expect(described_class::COMMAND).to eq('?') }
  end

  context '.applicable?' do
    it 'returns true for ?' do
      expect(subject.applicable?('?')).to eq true
    end

    it 'returns false for something is not ?' do
      expect(subject.applicable?('t')).to eq false
    end
  end

  context '.execute' do
    let(:result) do
      "For more on Reverse Polish Notation, please follow the link:\n" \
        'https://en.wikipedia.org/wiki/Reverse_Polish_notation'
    end

    it 'returns instructions' do
      expect(subject.execute).to eq result
    end
  end
end
