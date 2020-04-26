RSpec.describe Commands::ClearStack do
  subject { described_class }

  context 'COMMAND' do
    it { should be_const_defined(:COMMAND) }
    it { expect(described_class::COMMAND).to eq('c') }
  end

  context '.applicable?' do
    it 'returns true for c' do
      expect(subject.applicable?('c')).to eq true
    end

    it 'returns false for something is not c' do
      expect(subject.applicable?('t')).to eq false
    end
  end

  context '.execute' do
    let(:result) do
      'Stack has been cleared!'
    end

    it 'returns instructions' do
      expect(subject.execute).to eq result
    end
  end
end
