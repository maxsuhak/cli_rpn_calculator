RSpec.describe Tokenizer do
  subject { described_class }

  context '.eof?' do
    it 'returns true for q' do
      expect(subject.eof?('q')).to eq true
    end

    it 'returns true for nil' do
      expect(subject.eof?(nil)).to eq true
    end
  end

  context '.tokenize' do
    it 'returns valid token array for spaced string' do
      expect(subject.tokenize('4   5 6.0 +')).to eq ['4', '5', '6.0', '+']
    end
  end
end
