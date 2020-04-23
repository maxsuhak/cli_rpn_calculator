module Commands
  class WelcomeMessage
    class << self
      def applicable?(command)
        command == 'w'
      end

      def execute
        puts 'Welcome to the CLI RPN Calculator!'
      end
    end
  end
end
