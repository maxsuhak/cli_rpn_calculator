module Commands
  class Instructions < Base
    COMMAND = 'i'.freeze

    class << self
      def applicable?(command)
        command == COMMAND
      end

      def execute
        "Press 'i' for instructions on use.\n" \
          "Press '?' for a link to more info about RPN.\n" \
          "Press 's' to see the current stack.\n" \
          "Press 'c' to clear the current stack.\n" \
          "Press 'w' to repeat this welcome message.\n" \
          "Press 'q' to quit."
      end
    end
  end
end
