RSpec.describe Operators::Sin do
  subject { described_class }

  context 'OPERATOR' do
    it { should be_const_defined(:OPERATOR) }
    it { expect(described_class::OPERATOR).to eq('sin') }
  end

  context '.applicable?' do
    it 'returns true for +' do
      expect(subject.applicable?('sin')).to eq true
    end

    it 'returns false for something is not +' do
      expect(subject.applicable?('t')).to eq false
    end
  end

  context '.execute' do
    it 'returns -0.9880316240928618 for 30' do
      expect(subject.execute(30)).to eq -0.9880316240928618
    end
  end

  context '.number_of_operands' do
    it 'returns 1' do
      expect(subject.number_of_operands).to eq 1
    end
  end
end
