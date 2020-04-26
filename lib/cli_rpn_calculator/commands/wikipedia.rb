module Commands
  class Wikipedia < Base
    COMMAND = '?'.freeze

    class << self
      def applicable?(command)
        command == COMMAND
      end

      def execute
        "For more on Reverse Polish Notation, please follow the link:\n" \
          'https://en.wikipedia.org/wiki/Reverse_Polish_notation'
      end
    end
  end
end
