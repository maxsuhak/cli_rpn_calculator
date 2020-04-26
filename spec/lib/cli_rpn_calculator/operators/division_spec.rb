RSpec.describe Operators::Division do
  subject { described_class }

  context 'OPERATOR' do
    it { should be_const_defined(:OPERATOR) }
    it { expect(described_class::OPERATOR).to eq('/') }
  end

  context '.applicable?' do
    it 'returns true for /' do
      expect(subject.applicable?('/')).to eq true
    end

    it 'returns false for something is not /' do
      expect(subject.applicable?('t')).to eq false
    end
  end

  context '.execute' do
    it 'returns 5 for 25 and 5' do
      expect(subject.execute(25, 5)).to eq 5
    end

    it 'raise "Division by zero" ArgumentError for 3 and 0' do
      expect { subject.execute(3, 0) }.to raise_error(ArgumentError, 'Division by zero')
    end
  end

  context '.number_of_operands' do
     it 'returns 2' do
      expect(subject.number_of_operands).to eq 2
    end
  end
end
