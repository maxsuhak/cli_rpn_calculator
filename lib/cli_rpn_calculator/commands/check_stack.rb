module Commands
  class CheckStack
    COMMAND = 's'.freeze

    class << self
      def applicable?(command)
        command == COMMAND
      end

      def execute
        operands = []
        ObjectSpace.each_object(CLI) do |instance|
          operands << instance.instance_variable_get(:@operands)
        end
        "List of operands: #{operands.flatten.map(&:to_f)}"
      end
    end
  end
end
