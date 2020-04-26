RSpec.describe Commands::CheckStack do
  subject { described_class }

  context 'COMMAND' do
    it { should be_const_defined(:COMMAND) }
    it { expect(described_class::COMMAND).to eq('s') }
  end

  context '.applicable?' do
    it 'returns true for s' do
      expect(subject.applicable?('s')).to eq true
    end

    it 'returns false for something is not s' do
      expect(subject.applicable?('t')).to eq false
    end
  end

  context '.execute' do
    before do
      Commands::ClearStack.execute
    end

    let(:result) do
      'List of operands: []'
    end

    it 'returns instructions' do
      expect(subject.execute).to eq result
    end
  end
end
