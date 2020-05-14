RSpec.describe Operators::Tan do
  subject { described_class }

  context 'OPERATOR' do
    it { should be_const_defined(:OPERATOR) }
    it { expect(described_class::OPERATOR).to eq('tan') }
  end

  context '.applicable?' do
    it 'returns true for +' do
      expect(subject.applicable?('tan')).to eq true
    end

    it 'returns false for something is not tan' do
      expect(subject.applicable?('t')).to eq false
    end
  end

  context '.execute' do
    it 'returns 0.6483608274590866 for 10' do
      expect(subject.execute(10)).to eq 0.6483608274590866
    end
  end

  context '.number_of_operands' do
    it 'returns 1' do
      expect(subject.number_of_operands).to eq 1
    end
  end
end
