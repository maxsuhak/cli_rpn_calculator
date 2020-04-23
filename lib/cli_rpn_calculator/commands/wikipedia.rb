module Commands
  class Wikipedia
    class << self
      def applicable?(command)
        command == '?'
      end

      def execute
        puts 'For more on Reverse Polish Notation, please follow the link:'
        puts 'https://en.wikipedia.org/wiki/Reverse_Polish_notation'
      end
    end
  end
end
