RSpec.describe Commands::WelcomeMessage do
  subject { described_class }

  context 'COMMAND' do
    it { should be_const_defined(:COMMAND) }
    it { expect(described_class::COMMAND).to eq('w') }
  end

  context '.applicable?' do
    it 'returns true for w' do
      expect(subject.applicable?('w')).to eq true
    end

    it 'returns false for something is not w' do
      expect(subject.applicable?('t')).to eq false
    end
  end

  context '.execute' do
    let(:result) do
      'Welcome to the CLI RPN Calculator!'
    end

    it 'returns instructions' do
      expect(subject.execute).to eq result
    end
  end
end
