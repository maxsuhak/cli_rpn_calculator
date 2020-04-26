module Commands
  class WelcomeMessage < Base
    COMMAND = 'w'.freeze

    class << self
      def applicable?(command)
        command == COMMAND
      end

      def execute
        'Welcome to the CLI RPN Calculator!'
      end
    end
  end
end
