class Tokenizer
  class << self
    def eof?(input)
      ['q', nil].include?(input)
    end

    def tokenize(str)
      str.split(/\s+/)
    end
  end
end
