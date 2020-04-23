class Tokenizer
  class << self
    def eof?(input)
      input.nil? || input == 'q'
    end

    def tokenize(str)
      str.split(/\s+/)
    end
  end
end
