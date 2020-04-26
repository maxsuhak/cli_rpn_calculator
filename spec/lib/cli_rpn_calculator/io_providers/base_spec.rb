RSpec.describe IOProviders::Base do
  subject { described_class.new }

  context '#read' do
    it 'raise "NotImplementedError"' do
      expect { subject.read }.to raise_error(NotImplementedError)
    end
  end

  context '#write' do
    it 'raise "NotImplementedError"' do
      expect { subject.write }.to raise_error(NotImplementedError)
    end
  end
end
