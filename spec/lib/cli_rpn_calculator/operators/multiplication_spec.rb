RSpec.describe Operators::Multiplication do
  subject { described_class }

  context 'OPERATOR' do
    it { should be_const_defined(:OPERATOR) }
    it { expect(described_class::OPERATOR).to eq('*') }
  end

  context '.applicable?' do
    it 'returns true for *' do
      expect(subject.applicable?('*')).to eq true
    end

    it 'returns false for something is not *' do
      expect(subject.applicable?('t')).to eq false
    end
  end

  context '.execute' do
    it 'returns 5 for 5 and 1' do
      expect(subject.execute(5, 1)).to eq 5
    end

    it 'returns 0.06 for .2 and .3' do
      expect(subject.execute(BigDecimal('.2'), BigDecimal('.3'))).to eq BigDecimal('0.06')
    end
  end

  context '.number_of_operands' do
     it 'returns 2' do
      expect(subject.number_of_operands).to eq 2
    end
  end
end
