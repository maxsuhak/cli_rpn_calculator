module Commands
  class ClearStack
    COMMAND = 'c'.freeze

    class << self
      def applicable?(command)
        command == COMMAND
      end

      def execute
        ObjectSpace.each_object(CLI) do |instance|
          instance.instance_variable_set(:@operands, [])
        end

        'Stack has been cleared!'
      end
    end
  end
end
