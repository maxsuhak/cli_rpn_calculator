module Commands
  class CheckStack
    class << self
      def applicable?(command)
        command == 's'
      end

      def execute
        CLI.instance_variable_get(:@operands)
      end
    end
  end
end
