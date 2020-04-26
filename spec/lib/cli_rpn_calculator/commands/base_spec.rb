RSpec.describe Commands::Base do
  subject { described_class }

  context '.applicable?' do
    it 'raise "NotImplementedError"' do
      expect { subject.applicable?('i') }.to raise_error(NotImplementedError)
    end
  end

  context '.execute' do
    it 'raise "NotImplementedError"' do
      expect { subject.execute }.to raise_error(NotImplementedError)
    end
  end
end
