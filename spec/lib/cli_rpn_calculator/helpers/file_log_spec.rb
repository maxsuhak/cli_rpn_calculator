RSpec.describe Helpers::FileLog do
  subject { described_class }

  context '.name' do
    it 'returns file name' do
      expect(subject.name).to eq 'tmp/test.log'
    end
  end
end
