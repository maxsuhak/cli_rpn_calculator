module Commands
  class Instructions
    class << self
      def applicable?(command)
        command == 'i'
      end

      def execute
        puts "Press 'i' for instructions on use."
        puts "Press '?' for a link to more info about RPN."
        puts "Press 's' to see the current stack."
        puts "Press 'c' to clear the current stack."
        puts "Press 'w' to repeat this welcome message."
        puts "Press 'q' to quit."
      end
    end
  end
end
