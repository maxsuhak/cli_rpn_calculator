RSpec.describe Operators::Base do
  subject { described_class }

  context 'ALLOWED_NUMBER_OF_OPERANDS' do
    it { should be_const_defined(:ALLOWED_NUMBER_OF_OPERANDS) }
    it { expect(described_class::ALLOWED_NUMBER_OF_OPERANDS).to eq(2) }
  end

  context '.applicable?' do
    it 'raise "NotImplementedError"' do
      expect { subject.applicable?('+') }.to raise_error(NotImplementedError)
    end
  end

  context '.execute' do
    it 'raise "NotImplementedError"' do
      expect { subject.execute(2, 3) }.to raise_error(NotImplementedError)
    end
  end

  context '.number_of_operands' do
    it 'returns 2' do
      expect(subject.number_of_operands).to eq 2
    end
  end
end
