RSpec.describe Operators::Pythagorean do
  subject { described_class }

  context 'OPERATOR' do
    it { should be_const_defined(:OPERATOR) }
    it { expect(described_class::OPERATOR).to eq('pythagorean') }
  end

  context '.applicable?' do
    it 'returns true for +' do
      expect(subject.applicable?('pythagorean')).to eq true
    end

    it 'returns false for something is not pythagorean' do
      expect(subject.applicable?('t')).to eq false
    end
  end

  context '.execute' do
    it 'returns 5 for 4 and 3' do
      expect(subject.execute(4, 3)).to eq 5
    end
  end

  context '.number_of_operands' do
    it 'returns 2' do
      expect(subject.number_of_operands).to eq 2
    end
  end
end
